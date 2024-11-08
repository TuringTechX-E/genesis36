/// Displays the user's current carbon footprint and tips for reducing emissions.

import 'package:flutter/material.dart';

class CarbonFootprintWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Your Carbon Footprint',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Placeholder for carbon data, replace with live data
            Text(
              '150 kg CO₂ saved this month',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
