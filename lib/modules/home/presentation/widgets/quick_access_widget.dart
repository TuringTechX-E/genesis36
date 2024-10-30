import 'package:flutter/material.dart';

class QuickAccessWidget extends StatelessWidget {
  const QuickAccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickAccessIcon(Icons.store, "Marketplace", Colors.blue),
        _buildQuickAccessIcon(Icons.forum, "Community", Colors.green),
        _buildQuickAccessIcon(Icons.coach, "AI Coach", Colors.orange),
      ],
    );
  }

  Widget _buildQuickAccessIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
