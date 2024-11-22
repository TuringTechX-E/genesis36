import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_model.dart';
import 'token_manager.dart';
import 'encryption_service.dart';

class OAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final TokenManager _tokenManager;
  final EncryptionService _encryptionService;

  OAuthService(this._tokenManager, this._encryptionService);

  /// Sign in with Google OAuth
  Future<OAuthToken?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print('Google sign-in canceled');
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final tokenData = OAuthToken(
        accessToken: googleAuth.accessToken!,
        refreshToken: googleAuth.idToken!,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        provider: 'Google',
        providerData: {
          'userId': userCredential.user?.uid,
          'email': userCredential.user?.email,
          'displayName': userCredential.user?.displayName,
        },
      );

      await _storeAndEncryptToken(tokenData);
      return tokenData;
    } catch (e) {
      print('Google sign-in error: $e');
      return null;
    }
  }

  /// Sign in with Facebook OAuth
  Future<OAuthToken?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status != LoginStatus.success) {
        print('Facebook sign-in canceled or failed');
        return null;
      }

      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final tokenData = OAuthToken(
        accessToken: result.accessToken!.token,
        refreshToken: '',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        provider: 'Facebook',
        providerData: {
          'userId': userCredential.user?.uid,
          'email': userCredential.user?.email,
          'displayName': userCredential.user?.displayName,
        },
      );

      await _storeAndEncryptToken(tokenData);
      return tokenData;
    } catch (e) {
      print('Facebook sign-in error: $e');
      return null;
    }
  }

  /// Store and encrypt the OAuth token securely
  Future<void> _storeAndEncryptToken(OAuthToken token) async {
    final encryptedAccessToken = _encryptionService.encrypt(token.accessToken);
    final encryptedRefreshToken =
        _encryptionService.encrypt(token.refreshToken);

    await _secureStorage.write(
        key: '${token.provider}_accessToken', value: encryptedAccessToken);
    await _secureStorage.write(
        key: '${token.provider}_refreshToken', value: encryptedRefreshToken);

    // Store token metadata in TokenManager for session handling
    _tokenManager.storeToken(token);
  }

  /// Retrieve OAuth token from secure storage
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

      return OAuthToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: DateTime.now()
            .add(const Duration(hours: 1)), // Placeholder expiration
        provider: provider,
      );
    } catch (e) {
      print('Error retrieving OAuth token: $e');
      return null;
    }
  }

  /// Sign out from OAuth provider
  Future<void> signOut(String provider) async {
    if (provider == 'Google') {
      await _googleSignIn.signOut();
    } else if (provider == 'Facebook') {
      await FacebookAuth.instance.logOut();
    }

    await _secureStorage.delete(key: '${provider}_accessToken');
    await _secureStorage.delete(key: '${provider}_refreshToken');
    _tokenManager.clearToken(provider);
  }
}
