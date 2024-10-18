class UserSession {
  final String token;
  DateTime? expiration; // Session expiration time (for OAuth and token-based auth)
  
  UserSession({required this.token, this.expiration});
}

class OAuthToken {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  OAuthToken({required this.accessToken, required this.refreshToken, required this.expiresAt});
}

class BiometricAuthResult {
  final bool isAuthenticated;
  final String token;

  BiometricAuthResult({required this.isAuthenticated, required this.token});
}
