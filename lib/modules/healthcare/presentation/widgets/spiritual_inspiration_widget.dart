import 'package:flutter/material.dart';

class SpiritualInspirationWidget extends StatelessWidget {
  const SpiritualInspirationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text("Faith-Based Inspiration", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            "'Do you not know that your bodies are temples of the Holy Spirit?' (1 Corinthians 6:19)",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
