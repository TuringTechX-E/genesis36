import 'package:flutter/material.dart';

class EtherealKeyWidget extends StatelessWidget {
  const EtherealKeyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.vpn_key,  // Using a key icon to symbolize the ethereal key
          size: 80,
          color: Colors.white.withOpacity(0.8), // Ethereal glow effect
        ),
        const SizedBox(height: 10),
        Text(
          'Secure Access',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
