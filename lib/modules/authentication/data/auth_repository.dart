import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'auth_model.dart';
import 'biometric_service.dart';
import 'cache_service.dart';
import 'token_manager.dart';
import 'oauth_service.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final BiometricService _biometricService;
  final CacheService _cacheService;
  final TokenManager _tokenManager;
  final OAuthService _oauthService;
  final LocalAuthentication _localAuth = LocalAuthentication();

  AuthRepository(
    this._biometricService,
    this._cacheService,
    this._tokenManager,
    this._oauthService,
  );

  /// Sign in with email and password using Firebase
  Future<UserSession> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final tokenData = await userCredential.user?.getIdToken();
      _tokenManager.storeToken(tokenData);
      final session = UserSession(token: tokenData);
      _cacheService.storeSession(session);
      return session;
    } on FirebaseAuthException catch (e) {
      throw Exception('Email/Password login error: ${e.message}');
    }
  }

  /// Sign in with OAuth (Google, Facebook)
  Future<UserSession> signInWithOAuth(String provider) async {
    final tokenData = await _oauthService.signIn(provider);
    _tokenManager.storeToken(tokenData);
    final session = UserSession(token: tokenData.accessToken);
    _cacheService.storeSession(session);
    return session;
  }

  /// Sign in using biometrics (Fingerprint, Face Recognition)
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

  /// Google OAuth sign-in using Firebase
  Future<UserSession> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final tokenData = await userCredential.user?.getIdToken();
      _tokenManager.storeToken(tokenData);
      final session = UserSession(token: tokenData);
      _cacheService.storeSession(session);
      return session;
    } on FirebaseAuthException catch (e) {
      throw Exception('Google sign-in error: ${e.message}');
    }
  }

  /// Facebook OAuth sign-in using Firebase
  Future<UserSession> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status != LoginStatus.success) return null;

      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final tokenData = await userCredential.user?.getIdToken();
      _tokenManager.storeToken(tokenData);
      final session = UserSession(token: tokenData);
      _cacheService.storeSession(session);
      return session;
    } on FirebaseAuthException catch (e) {
      throw Exception('Facebook sign-in error: ${e.message}');
    }
  }

  /// Checks if biometric authentication is supported
  Future<bool> isBiometricSupported() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  /// Logout the user from all services
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    await _tokenManager.clearTokens();
    await _cacheService.clearCache();
  }
}
