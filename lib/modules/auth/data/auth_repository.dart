import 'auth_model.dart';
import 'biometric_service.dart';
import 'cache_service.dart';
import 'token_manager.dart';
import 'oauth_service.dart';

class AuthRepository {
  final BiometricService _biometricService;
  final CacheService _cacheService;
  final TokenManager _tokenManager;
  final OAuthService _oauthService;

  AuthRepository(this._biometricService, this._cacheService, this._tokenManager,
      this._oauthService);

  // Sign in with OAuth (Google, Facebook, etc.)
  Future<UserSession> signInWithOAuth(String provider) async {
    final tokenData = await _oauthService.signIn(provider);
    _tokenManager.storeToken(tokenData); // Efficiently manage tokens
    final session = UserSession(token: tokenData.accessToken);
    _cacheService.storeSession(session); // Cache the session
    return session;
  }

  // Sign in using biometrics (fingerprint, face recognition)
  Future<UserSession> signInWithBiometrics() async {
    final result = await _biometricService.authenticate();
    if (result.isAuthenticated) {
      _tokenManager.storeToken(result.token);
      final session = UserSession(token: result.token);
      _cacheService.storeSession(session);
      return session;
    } else {
      throw Exception("Biometric Authentication Failed");
    }
  }

  // Logout the user
  Future<void> signOut() async {
    await _tokenManager.clearTokens(); // Clear tokens on sign out
    await _cacheService.clearCache(); // Clear cached sessions
  }
}
