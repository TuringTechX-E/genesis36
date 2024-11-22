import 'package:flutter/material.dart';
import 'health_metric_circle.dart';
import 'spiritual_inspiration_widget.dart';

class HealthCompassWidget extends StatelessWidget {
  const HealthCompassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Your Health Compass", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HealthMetricCircle(label: "Steps", value: "4500", target: "6000", color: Colors.blue),
                HealthMetricCircle(label: "Sleep", value: "6.5h", target: "8h", color: Colors.purple),
                HealthMetricCircle(label: "Hydration", value: "1.5L", target: "2L", color: Colors.green),
              ],
            ),
            SizedBox(height: 20),
            SpiritualInspirationWidget(),  // Faith-based encouragement below health metrics
          ],
        ),
      ),
    );
  }
}
