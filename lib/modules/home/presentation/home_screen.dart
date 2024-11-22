import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Genesis360 Dashboard"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingSection(),
            const SizedBox(height: 20),
            _buildEcoImpactTracker(),
            const SizedBox(height: 20),
            _buildHealthWellnessFeed(),
            const SizedBox(height: 20),
            _buildGlobalImpactNews(),
          ],
        ),
      ),
    );
  }

  /// Greeting Section with weather/environment icon
  Widget _buildGreetingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back, User!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Today’s Environmental Status: Healthy 🌿",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
        const Icon(
          Icons.wb_sunny,
          color: Colors.amber,
          size: 36,
        ),
      ],
    );
  }

  /// Eco-Impact Tracker section showing carbon footprint progress
  Widget _buildEcoImpactTracker() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Eco-Impact Tracker",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CircularPercentIndicator(
              radius: 70,
              lineWidth: 12,
              percent: 0.65,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "65%",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text("Goal"),
                ],
              ),
              progressColor: Colors.green.shade600,
              backgroundColor: Colors.green.shade100,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildImpactIcon(Icons.recycling, "Recycling"),
                _buildImpactIcon(Icons.energy_savings_leaf, "Energy"),
                _buildImpactIcon(Icons.eco, "Habits"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.teal.shade600),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.teal.shade800)),
      ],
    );
  }

  /// Health & Wellness Feed displaying personalized health tips
  Widget _buildHealthWellnessFeed() {
    final healthTips = [
      "Walk 10,000 steps today 🌟",
      "Drink 8 cups of water 🥤",
      "30 min of meditation 🧘",
      "Eat more greens 🥗",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Health & Wellness",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: healthTips.length,
            itemBuilder: (context, index) {
              return _buildHealthTipCard(healthTips[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHealthTipCard(String tip) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(right: 12),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.favorite, color: Colors.pink),
            const SizedBox(width: 10),
            Expanded(child: Text(tip)),
          ],
        ),
      ),
    );
  }

  /// Global Impact News and Community Highlights section
  Widget _buildGlobalImpactNews() {
    final newsItems = [
      "New Solar Plant Opens in Kenya 🌞",
      "Community Achieves 30% Plastic Reduction ♻️",
      "Blockchain for Carbon Tracking Gaining Momentum 🌍",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Global Impact News",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newsItems.length,
            itemBuilder: (context, index) {
              return _buildNewsCard(newsItems[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsCard(String news) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(right: 12),
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text("Read more", style: TextStyle(color: Colors.blue.shade600)),
          ],
        ),
      ),
    );
  }
}
