import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class EncryptionService {
  static const _secureStorage = FlutterSecureStorage();
  static const _keyAlias = 'encryption_key';
  static const _ivAlias = 'encryption_iv';

  late final Key _key;
  late final IV _iv;
  late final Encrypter _encrypter;

  EncryptionService() {
    _initializeKeys();
  }

  /// Initialize encryption keys (load from secure storage or generate new keys)
  Future<void> _initializeKeys() async {
    final storedKey = await _secureStorage.read(key: _keyAlias);
    final storedIv = await _secureStorage.read(key: _ivAlias);

    if (storedKey == null || storedIv == null) {
      // Generate new key and IV
      _key = Key.fromSecureRandom(32);
      _iv = IV.fromSecureRandom(16);

      // Store securely
      await _secureStorage.write(
          key: _keyAlias, value: base64UrlEncode(_key.bytes));
      await _secureStorage.write(
          key: _ivAlias, value: base64UrlEncode(_iv.bytes));
    } else {
      // Load existing key and IV
      _key = Key(base64Url.decode(storedKey));
      _iv = IV(base64Url.decode(storedIv));
    }

    _encrypter = Encrypter(AES(_key, mode: AESMode.cbc));
  }

  /// Encrypt data with AES and return Base64 string
  String encrypt(String value) {
    final encrypted = _encrypter.encrypt(value, iv: _iv);
    final hmac = _generateHMAC(value);
    return '${encrypted.base64}|$hmac';
  }

  /// Decrypt data and verify integrity using HMAC
  String decrypt(String encrypted) {
    try {
      final parts = encrypted.split('|');
      if (parts.length != 2) throw Exception('Invalid encrypted format');

      final encryptedData = parts[0];
      final providedHmac = parts[1];

      final decrypted = _encrypter.decrypt64(encryptedData, iv: _iv);
      final calculatedHmac = _generateHMAC(decrypted);

      // Verify HMAC for data integrity
      if (calculatedHmac != providedHmac) {
        throw Exception('Data integrity check failed');
      }

      return decrypted;
    } catch (e) {
      print('Decryption error: $e');
      throw Exception('Failed to decrypt data');
    }
  }

  /// Generate HMAC for integrity check
  String _generateHMAC(String data) {
    final hmacKey = _key.bytes;
    final hmac = Hmac(sha256, hmacKey);
    final digest = hmac.convert(utf8.encode(data));
    return base64UrlEncode(digest.bytes);
  }

  /// Clear stored keys (for logout or security purposes)
  Future<void> clearKeys() async {
    await _secureStorage.delete(key: _keyAlias);
    await _secureStorage.delete(key: _ivAlias);
  }
}
