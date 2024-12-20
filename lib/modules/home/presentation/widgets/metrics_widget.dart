import 'package:flutter/material.dart';

class MetricsWidget extends StatelessWidget {
  const MetricsWidget({super.key});

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
          children: [
            _buildMetricRow("Carbon Footprint", "45%"),
            const SizedBox(height: 8),
            _buildMetricRow("Renewable Energy Usage", "80%"),
            const SizedBox(height: 8),
            _buildMetricRow("Health Score", "95"),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(fontSize: 16, color: Colors.blue)),
      ],
    );
  }
}
