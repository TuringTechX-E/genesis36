import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// Check if the device has biometric sensors
  Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  /// Authenticate using biometrics (fingerprint or face recognition)
  Future<bool> authenticateWithBiometrics(String localizedReason) async {
    try {
      final availableBiometrics = await _auth.getAvailableBiometrics();
      if (availableBiometrics.contains(BiometricType.fingerprint) ||
          availableBiometrics.contains(BiometricType.face)) {
        return await _auth.authenticate(
          localizedReason: localizedReason, // Pass localized reason here
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Get the available biometric types (fingerprint, face, etc.)
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return <BiometricType>[]; // Return empty list if there's an error
    }
  }
}
