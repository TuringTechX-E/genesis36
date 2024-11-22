import 'package:flutter/material.dart';
import '../../data/biometric_service.dart';
import 'package:local_auth/local_auth.dart'; // Import biometric types

class BiometricButtonWidget extends StatelessWidget {
  final BiometricService _biometricService = BiometricService();

  BiometricButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BiometricType>>(
      future: _biometricService.getAvailableBiometrics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            String biometricText = 'Login with Biometrics';
            String localizedReason = 'Authenticate to continue';

            // Show different text based on the available biometric type
            if (snapshot.data!.contains(BiometricType.fingerprint)) {
              biometricText = 'Login with Fingerprint';
              localizedReason = 'Use your fingerprint to authenticate';
            } else if (snapshot.data!.contains(BiometricType.face)) {
              biometricText = 'Login with Face Recognition';
              localizedReason = 'Use face recognition to authenticate';
            }

            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                // Pass the localizedReason to the biometric service
                bool success = (await _biometricService.authenticateWithBiometrics(localizedReason)) as bool;
                if (success) {
                  // Handle successful authentication
                  print('Biometric authesntication successful');
                } else {
                  // Handle failed authentication
                  print('Biometric authentication failed');
                }
              },
              child: Text(
                biometricText,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return const Text('No biometric hardware found');
          }
        } else {
          return const CircularProgressIndicator(); // Loading indicator while checking biometrics
        }
      },
    );
  }
}
