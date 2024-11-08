import 'package:flutter/material.dart';
import 'widgets/health_compass_widget.dart';

class HealthcareScreen extends StatelessWidget {
  const HealthcareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI-Powered Health Compass"),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HealthCompassWidget(),            // Main Health Compass displaying metrics
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
