import 'package:flutter/material.dart';
import 'widgets/ethereal_key_widget.dart';
import 'widgets/auth_button_widget.dart';
import 'widgets/biometric_button_widget.dart';
import 'widgets/oauth_login_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/serene_landscape.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Transparent Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), // Dark overlay for contrast
            ),
          ),
          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ethereal Key Icon Widget
                const EtherealKeyWidget(),

                const SizedBox(height: 40),

                // Sign In Button
                AuthButtonWidget(
                  text: 'Sign In',
                  onPressed: () {
                    // TODO: Implement sign-in logic
                  },
                ),

                const SizedBox(height: 20),

                // Create Account Button
                AuthButtonWidget(
                  text: 'Create Account',
                  onPressed: () {
                    // TODO: Implement sign-up logic
                  },
                ),

                const SizedBox(height: 20),

                // Biometric Authentication Button (Fingerprint/Face)
                BiometricButtonWidget(),

                const SizedBox(height: 20),

                // OAuth Buttons (Google, Facebook, etc.)
                const OAuthLoginWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
