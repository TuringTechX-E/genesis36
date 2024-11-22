import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For the bar chart in Habitat Health Monitor

class WildlifeGuardianScreen extends StatelessWidget {
  const WildlifeGuardianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wildlife Guardian"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Stack(
        children: [
          _buildAnimatedBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMapSection(),
                const SizedBox(height: 20),
                _buildWildlifeMovementTracker(),
                const SizedBox(height: 20),
                _buildHabitatHealthMonitor(),
                const SizedBox(height: 20),
                _buildCommunityConservationActions(),
                const SizedBox(height: 30),
              ],
            ),
          ),
          _buildProtectNowButton(),
        ],
      ),
    );
  }

  /// Animated Wildlife Background
  Widget _buildAnimatedBackground() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.1,
        child: Image.asset(
          "assets/images/wildlife_background.png", // Background with subtle silhouettes of animals
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Map Section displaying Wildlife Monitoring Zones
  Widget _buildMapSection() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Wildlife Monitoring Zones",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              height: 200,
              color: Colors.blue.shade50,
              child: Center(
                child: Text(
                  "Interactive Map Placeholder\n(Click on markers to view zone details)",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Wildlife Movements Tracker Section
  Widget _buildWildlifeMovementTracker() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Track Wildlife Movements",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Radar Simulation for Migration Paths",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTrackingIcon(Icons.pets, "Elephants"),
                _buildTrackingIcon(Icons.eco, "Birds"),
                _buildTrackingIcon(Icons.local_florist, "Plants"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal.shade700, size: 30),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.teal.shade800)),
      ],
    );
  }

  /// Habitat Health Monitor with a Bar Chart
  Widget _buildHabitatHealthMonitor() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Habitat Health Monitor",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 150,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barGroups: [
                    _buildBarChartGroupData(0, 80, Colors.green.shade700), // Vegetation
                    _buildBarChartGroupData(1, 60, Colors.orange.shade600), // Air Quality
                    _buildBarChartGroupData(2, 90, Colors.blue.shade400),   // Water Quality
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Vegetation"),
                Text("Air Quality"),
                Text("Water Quality"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBarChartGroupData(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(y: y, colors: [color], width: 20),
      ],
    );
  }

  /// Community Conservation Actions Section
  Widget _buildCommunityConservationActions() {
    final guardians = [
      {"name": "Alex", "action": "Tree Planting"},
      {"name": "Riley", "action": "Beach Cleanup"},
      {"name": "Jordan", "action": "Wildlife Donation"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Community Conservation Actions",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: guardians.length,
            itemBuilder: (context, index) {
              return _buildGuardianCard(guardians[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGuardianCard(Map<String, String> guardian) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(right: 12),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade100,
              child: Text(guardian["name"]![0]), // First letter of the name
            ),
            const SizedBox(height: 8),
            Text(guardian["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(guardian["action"]!, style: TextStyle(color: Colors.teal.shade700)),
          ],
        ),
      ),
    );
  }

  /// "Protect Now" Button
  Widget _buildProtectNowButton() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: ElevatedButton.icon(
        onPressed: () {
          // Action for Protect Now button
          print("Protect Now tapped");
        },
        icon: const Icon(Icons.shield, size: 24),
        label: const Text("Protect Now"),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.green.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
