import 'package:flutter/material.dart';

class ReportSightingWidget extends StatelessWidget {
  const ReportSightingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Report a Sighting",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Report sightings with photo evidence",
                style: TextStyle(fontSize: 14)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement species sighting reporting
              },
              child: const Text("Report Sighting"),
            ),
          ],
        ),
      ),
    );
  }
}
