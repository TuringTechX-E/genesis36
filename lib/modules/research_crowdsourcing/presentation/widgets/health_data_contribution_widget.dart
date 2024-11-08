import 'package:flutter/material.dart';

class HealthDataContributionWidget extends StatelessWidget {
  const HealthDataContributionWidget({Key? key}) : super(key: key);

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
            Text("Contribute Health Data", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
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
        TextField(
          decoration: InputDecoration(labelText: "Data Type (e.g., Steps, Heart Rate)"),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Value"),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement data submission logic
          },
          child: Text("Submit Data"),
        ),
      ],
    );
  }
}
