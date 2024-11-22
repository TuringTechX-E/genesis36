import 'package:flutter/material.dart';
import 'widgets/ai_decision_widget.dart';
import 'widgets/recommendation_list_widget.dart';

class DiscernmentScreen extends StatelessWidget {
  const DiscernmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discernment Engine"),
        backgroundColor: Colors.green.shade800,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AI-Powered Recommendations",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            AIDecisionWidget(), // Displays key AI insights
            SizedBox(height: 20),
            RecommendationListWidget(), // List of additional AI recommendations
          ],
        ),
      ),
    );
  }
}
