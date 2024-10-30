import 'package:flutter/material.dart';

class NewsFeedWidget extends StatelessWidget {
  const NewsFeedWidget({Key? key}) : super(key: key);

  final List<String> newsItems = [
    'Climate change threatens global biodiversity',
    'Healthcare advancements reduce disease rates',
    'New initiatives in renewable energy markets',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Global News", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Column(
          children: newsItems.map((item) => _buildNewsItem(item)).toList(),
        ),
      ],
    );
  }

  Widget _buildNewsItem(String news) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.fiber_manual_record, size: 12, color: Colors.green),
          SizedBox(width: 8),
          Expanded(child: Text(news, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
