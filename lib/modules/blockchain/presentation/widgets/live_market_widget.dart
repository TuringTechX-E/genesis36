import 'package:flutter/material.dart';

class LiveMarketWidget extends StatelessWidget {
  const LiveMarketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Live REC Market", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildMarketRow("Solar REC", "\$24.50"),
            _buildMarketRow("Wind REC", "\$22.75"),
            _buildMarketRow("Hydro REC", "\$20.00"),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketRow(String type, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(type, style: const TextStyle(fontSize: 14)),
          Text(price, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue)),
        ],
      ),
    );
  }
}
