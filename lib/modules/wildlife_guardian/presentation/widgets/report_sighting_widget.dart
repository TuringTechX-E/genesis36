import 'package:flutter/material.dart';

class ReportSightingWidget extends StatelessWidget {
  const ReportSightingWidget({Key? key}) : super(key: key);

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
            Text("Report a Sighting",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Report sightings with photo evidence",
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement species sighting reporting
              },
              child: Text("Report Sighting"),
            ),
          ],
        ),
      ),
    );
  }
}
