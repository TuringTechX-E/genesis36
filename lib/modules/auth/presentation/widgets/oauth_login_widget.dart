import 'package:flutter/material.dart';

class OAuthLoginWidget extends StatelessWidget {
  const OAuthLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Google Login Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            // Handle Google Login
          },
          child: const Text(
            'Login with Google',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        // Facebook Login Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            // Handle Facebook Login
          },
          child: const Text(
            'Login with Facebook',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
