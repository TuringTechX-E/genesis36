class UserSession {
  final String token;
  final String userId;
  final String email;
  final DateTime createdAt;
  final DateTime? expiration;
  final bool isBiometricEnabled;
  final Map<String, dynamic>? metadata;

  UserSession({
    required this.token,
    required this.userId,
    required this.email,
    required this.createdAt,
    this.expiration,
    this.isBiometricEnabled = false,
    this.metadata,
  });

  /// Check if the session is still valid
  bool get isValid =>
      expiration == null || DateTime.now().isBefore(expiration!);

  /// Convert UserSession to JSON
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'userId': userId,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
      'expiration': expiration?.toIso8601String(),
      'isBiometricEnabled': isBiometricEnabled,
      'metadata': metadata,
    };
  }

  /// Create UserSession from JSON
  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      token: json['token'],
      userId: json['userId'],
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
      expiration: json['expiration'] != null
          ? DateTime.parse(json['expiration'])
          : null,
      isBiometricEnabled: json['isBiometricEnabled'] ?? false,
      metadata: json['metadata'],
    );
  }
}
