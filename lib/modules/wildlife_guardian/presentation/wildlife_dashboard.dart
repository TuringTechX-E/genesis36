import 'package:flutter/material.dart';
import 'widgets/species_tracker_widget.dart';
import 'widgets/report_sighting_widget.dart';
import 'widgets/conservation_projects_widget.dart';
import 'widgets/guardian_insights_widget.dart';

class WildlifeDashboard extends StatelessWidget {
  const WildlifeDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wildlife Guardian"),
        backgroundColor: Colors.green.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SpeciesTrackerWidget(),
            SizedBox(height: 20),
            ReportSightingWidget(),
            SizedBox(height: 20),
            ConservationProjectsWidget(),
            SizedBox(height: 20),
            GuardianInsightsWidget(),
          ],
        ),
      ),
    );
  }
}
