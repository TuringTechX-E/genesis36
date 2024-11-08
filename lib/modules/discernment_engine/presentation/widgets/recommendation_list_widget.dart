import 'package:flutter/material.dart';

class RecommendationListWidget extends StatelessWidget {
  const RecommendationListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Additional Recommendations",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        _buildRecommendation(
            "Sustainability: Reduce energy usage to lower carbon footprint."),
        SizedBox(height: 8),
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
          Icon(Icons.lightbulb_outline, color: Colors.green),
          SizedBox(width: 8),
          Expanded(child: Text(suggestion, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
