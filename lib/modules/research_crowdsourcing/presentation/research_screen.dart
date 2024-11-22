import 'package:flutter/material.dart';
import 'widgets/research_project_widget.dart';
import 'widgets/health_data_contribution_widget.dart';

class ResearchScreen extends StatelessWidget {
  const ResearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Research Crowdsourcing"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current Research Projects",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ResearchProjectWidget(), // Displays a list of research projects
            SizedBox(height: 20),
            HealthDataContributionWidget(), // Widget for submitting health data contributions
          ],
        ),
      ),
    );
  }
}
