import 'package:myapp/modules/authentication/data/auth_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'encryption_service.dart';

class TokenManager {
  final PriorityQueue<OAuthToken> _tokenQueue = PriorityQueue<OAuthToken>(
    (a, b) => a.expiresAt.compareTo(b.expiresAt),
  );
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final EncryptionService _encryptionService;

  TokenManager(this._encryptionService);

  /// Store the token securely and add it to the priority queue
  Future<void> storeToken(OAuthToken token) async {
    final encryptedAccessToken = _encryptionService.encrypt(token.accessToken);
    final encryptedRefreshToken =
        _encryptionService.encrypt(token.refreshToken);

    // Save encrypted tokens in secure storage
    await _secureStorage.write(
        key: '${token.provider}_accessToken', value: encryptedAccessToken);
    await _secureStorage.write(
        key: '${token.provider}_refreshToken', value: encryptedRefreshToken);

    // Add token to the priority queue for expiration tracking
    _tokenQueue.add(token);
  }

  /// Retrieve the next expiring token (useful for refresh logic)
  OAuthToken? getNextExpiringToken() {
    _removeExpiredTokens();
    return _tokenQueue.isNotEmpty ? _tokenQueue.first : null;
  }

  /// Refresh tokens if the next expiring token is nearing expiration
  Future<void> handleTokenRefreshIfNeeded() async {
    final nextToken = getNextExpiringToken();
    if (nextToken == null || !nextToken.needsRefresh()) return;

    // Assume a refreshToken method is available in OAuthService
    final refreshedToken = await _refreshToken(nextToken);
    if (refreshedToken != null) {
      await storeToken(refreshedToken);
    }
  }

  /// Clear all tokens for a specific provider or clear all tokens
  Future<void> clearTokens({String? provider}) async {
    if (provider != null) {
      await _secureStorage.delete(key: '${provider}_accessToken');
      await _secureStorage.delete(key: '${provider}_refreshToken');
    }
    _tokenQueue.clear();
  }

  /// Retrieve a token securely from storage
  Future<OAuthToken?> retrieveToken(String provider) async {
    try {
      final encryptedAccessToken =
          await _secureStorage.read(key: '${provider}_accessToken');
      final encryptedRefreshToken =
          await _secureStorage.read(key: '${provider}_refreshToken');

      if (encryptedAccessToken == null) return null;

      final accessToken = _encryptionService.decrypt(encryptedAccessToken);
      final refreshToken = encryptedRefreshToken != null
          ? _encryptionService.decrypt(encryptedRefreshToken)
          : '';

      final expiration = DateTime.now()
          .add(const Duration(hours: 1)); // Placeholder expiration

      return OAuthToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: expiration,
        provider: provider,
      );
    } catch (e) {
      print('Error retrieving token for provider $provider: $e');
      return null;
    }
  }

  /// Private method to refresh an OAuth token
  Future<OAuthToken?> _refreshToken(OAuthToken token) async {
    // Placeholder: Integrate with OAuthService for actual token refresh logic
    print('Refreshing token for provider ${token.provider}');
    return OAuthToken(
      accessToken: '${token.accessToken}_refreshed',
      refreshToken: token.refreshToken,
      expiresAt: DateTime.now().add(const Duration(hours: 1)),
      provider: token.provider,
    );
  }

  /// Remove expired tokens from the priority queue
  void _removeExpiredTokens() {
    final currentTime = DateTime.now();
    _tokenQueue.removeWhere((token) => currentTime.isAfter(token.expiresAt));
  }
}
