class UserSession {
  final String token;
  final String userId;
  final String email;
  final DateTime createdAt;
  final DateTime? expiration;
  final bool isBiometricEnabled;
  final Map<String, dynamic>?
      metadata; // Additional session info (e.g., blockchain data)

  UserSession({
    required this.token,
    required this.userId,
    required this.email,
    required this.createdAt,
    this.expiration,
    this.isBiometricEnabled = false,
    this.metadata,
  });

  /// Check if the session is still valid based on the expiration time
  bool get isValid =>
      expiration == null || DateTime.now().isBefore(expiration!);

  /// Provides a summary of the session for UI display
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'isBiometricEnabled': isBiometricEnabled,
      'expiresIn':
          expiration?.difference(DateTime.now()).inMinutes ?? 'No Expiration',
    };
  }
}

class OAuthToken {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;
  final String
      provider; // Indicates the OAuth provider (Google, Facebook, etc.)
  final Map<String, dynamic>?
      providerData; // Extra data from OAuth (e.g., profile info)

  OAuthToken({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.provider,
    this.providerData,
  });

  /// Check if the access token is expired
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Refresh the token if needed
  bool needsRefresh() =>
      isExpired || expiresAt.difference(DateTime.now()).inMinutes < 10;
}

class BiometricAuthResult {
  final bool isAuthenticated;
  final String token;
  final DateTime timestamp;
  final String method; // Method of biometric auth (Fingerprint, FaceID)
  final Map<String, dynamic>? additionalData; // Metadata (e.g., device info)

  BiometricAuthResult({
    required this.isAuthenticated,
    required this.token,
    required this.timestamp,
    required this.method,
    this.additionalData,
  });

  /// Check if the authentication result is recent (e.g., within 5 minutes)
  bool isRecent() => DateTime.now().difference(timestamp).inMinutes <= 5;
}
