import 'package:flutter/material.dart';

class HealthMetricCircle extends StatelessWidget {
  final String label;
  final String value;
  final String target;
  final Color color;

  const HealthMetricCircle({
    Key? key,
    required this.label,
    required this.value,
    required this.target,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: double.parse(value) / double.parse(target), // Progress calculation
              strokeWidth: 6,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation(color),
            ),
            Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
