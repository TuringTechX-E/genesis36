import 'package:flutter/material.dart';

class HealthDataContributionWidget extends StatelessWidget {
  const HealthDataContributionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Contribute Health Data", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildHealthDataForm(),  // Form for inputting health data
          ],
        ),
      ),
    );
  }

  Widget _buildHealthDataForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          decoration: InputDecoration(labelText: "Data Type (e.g., Steps, Heart Rate)"),
        ),
        const TextField(
          decoration: InputDecoration(labelText: "Value"),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement data submission logic
          },
          child: const Text("Submit Data"),
        ),
      ],
    );
  }
}
