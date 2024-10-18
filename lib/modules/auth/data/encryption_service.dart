import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';

class EncryptionService {
  final _key = Key.fromUtf8('32charslongpassphraseforencryption');
  final _iv = IV.fromLength(16);
  final Encrypter _encrypter = Encrypter(AES(Key.fromLength(32)));

  // Encrypt data
  String encrypt(String value) {
    final encrypted = _encrypter.encrypt(value, iv: _iv);
    return encrypted.base64;
  }

  // Decrypt data
  String decrypt(String encrypted) {
    final decrypted = _encrypter.decrypt64(encrypted, iv: _iv);
    return decrypted;
  }
}
