import 'package:flutter/material.dart';

class TransparencyOverviewWidget extends StatelessWidget {
  const TransparencyOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Transparency Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildMetricRow("Verified Transactions", 24),
            _buildMetricRow("Pending Transactions", 6),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(String title, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Text(value.toString(), style: const TextStyle(fontSize: 14, color: Colors.green)),
        ],
      ),
    );
  }
}
