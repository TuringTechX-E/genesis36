import 'package:flutter/material.dart';

class RecommendationListWidget extends StatelessWidget {
  const RecommendationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Additional Recommendations",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _buildRecommendation(
            "Sustainability: Reduce energy usage to lower carbon footprint."),
        const SizedBox(height: 8),
        _buildRecommendation(
            "Socioeconomic: Participate in community volunteer work."),
      ],
    );
  }

  Widget _buildRecommendation(String suggestion) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.lightbulb_outline, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(suggestion, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
