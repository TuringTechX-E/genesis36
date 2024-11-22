import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// Checks if the device supports biometric authentication
  Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics && await _auth.isDeviceSupported();
    } catch (e) {
      print('Error checking biometrics support: $e');
      return false;
    }
  }

  /// Authenticates the user using biometrics (Fingerprint, Face Recognition)
  /// Returns a detailed result with metadata about the authentication process
  Future<BiometricAuthResult> authenticateWithBiometrics(String localizedReason) async {
    try {
      final availableBiometrics = await _auth.getAvailableBiometrics();
      if (availableBiometrics.isEmpty) {
        return BiometricAuthResult(
          isAuthenticated: false,
          token: '',
          timestamp: DateTime.now(),
          method: 'None',
          additionalData: {'error': 'No biometric sensors available'},
        );
      }

      String method = _getPreferredBiometricMethod(availableBiometrics);
      bool isAuthenticated = await _auth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      return BiometricAuthResult(
        isAuthenticated: isAuthenticated,
        token: isAuthenticated ? _generateBiometricToken(method) : '',
        timestamp: DateTime.now(),
        method: method,
        additionalData: {
          'availableBiometrics': availableBiometrics.map((e) => e.toString()).toList(),
        },
      );
    } on PlatformException catch (e) {
      return BiometricAuthResult(
        isAuthenticated: false,
        token: '',
        timestamp: DateTime.now(),
        method: 'Error',
        additionalData: {'error': e.message ?? 'Unknown error'},
      );
    }
  }

  /// Returns a list of supported biometric types (e.g., Fingerprint, Face)
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      print('Error retrieving available biometrics: $e');
      return <BiometricType>[];
    }
  }

  /// Helper function to determine the preferred biometric method
  String _getPreferredBiometricMethod(List<BiometricType> availableBiometrics) {
    if (availableBiometrics.contains(BiometricType.face)) {
      return 'Face Recognition';
    } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      return 'Fingerprint';
    }
    return 'Unknown';
  }

  /// Generates a mock token for biometric authentication (simulating blockchain-secured token)
  String _generateBiometricToken(String method) {
    // Here you could integrate a real token generation service, e.g., using blockchain
    return 'biometric_${method}_${DateTime.now().millisecondsSinceEpoch}';
  }
}

/// Data model for biometric authentication result
class BiometricAuthResult {
  final bool isAuthenticated;
  final String token;
  final DateTime timestamp;
  final String method;
  final Map<String, dynamic>? additionalData;

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
