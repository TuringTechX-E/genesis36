import 'package:flutter/material.dart';

class NewsFeedWidget extends StatelessWidget {
  const NewsFeedWidget({super.key});

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
        const Text("Global News",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
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
          const Icon(Icons.fiber_manual_record, size: 12, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(child: Text(news, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
