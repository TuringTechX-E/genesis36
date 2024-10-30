import 'package:flutter/material.dart';
import 'widgets/metrics_widget.dart';
import 'widgets/news_feed_widget.dart';
import 'widgets/quick_access_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metrics Widget (Carbon footprint, renewable energy usage, health score)
            MetricsWidget(),

            SizedBox(height: 20),

            // News Feed Widget
            NewsFeedWidget(),

            SizedBox(height: 20),

            // Quick Access Widget (Marketplace, Community, AI Coach)
            QuickAccessWidget(),
          ],
        ),
      ),
    );
  }
}
