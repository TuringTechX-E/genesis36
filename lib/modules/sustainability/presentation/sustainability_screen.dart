import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResearchCrowdsourcingScreen extends StatelessWidget {
  const ResearchCrowdsourcingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Research Crowdsourcing"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 20),
            _buildActiveResearchProjects(),
            const SizedBox(height: 20),
            _buildContributionDashboard(),
            const SizedBox(height: 20),
            _buildImpactFeed(),
            const SizedBox(height: 30),
            _buildGetInvolvedButton(),
          ],
        ),
      ),
    );
  }

  /// Header section with the title and icon
  Widget _buildHeaderSection() {
    return Row(
      children: [
        const Icon(Icons.science, color: Colors.blueAccent, size: 36),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contribute to Global Research",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Join studies to advance medical science",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      ],
    );
  }

  /// Active Research Projects section displaying cards with research projects
  Widget _buildActiveResearchProjects() {
    final projects = [
      {"title": "Cardiovascular Health Study", "progress": 0.7, "icon": Icons.favorite},
      {"title": "Sleep and Wellness Study", "progress": 0.4, "icon": Icons.nights_stay},
      {"title": "Genetic Insights Study", "progress": 0.85, "icon": Icons.dna},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Active Research Projects",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...projects.map((project) => _buildProjectCard(project)),
      ],
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(project["icon"], color: Colors.blueAccent, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project["title"] as String,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: project["progress"] as double,
                    color: Colors.blueAccent,
                    backgroundColor: Colors.blue.shade100,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to contribute data screen
                print("Contribute Data tapped");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Contribute"),
            ),
          ],
        ),
      ),
    );
  }

  /// Personal Contribution Dashboard with progress ring
  Widget _buildContributionDashboard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Your Contribution Dashboard",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CircularPercentIndicator(
              radius: 70,
              lineWidth: 12,
              percent: 0.65, // For demonstration
              center: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "65%",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("Contributed"),
                ],
              ),
              progressColor: Colors.blueAccent,
              backgroundColor: Colors.blue.shade100,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDataTypeIcon(Icons.favorite, "Heart Rate"),
                _buildDataTypeIcon(Icons.nights_stay, "Sleep Patterns"),
                _buildDataTypeIcon(Icons.dna, "Genetic Data"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTypeIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 30),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.blue.shade800)),
      ],
    );
  }

  /// Impact Feed section displaying a carousel of community impact stories
  Widget _buildImpactFeed() {
    final impactStories = [
      "500 samples contributed to Cardiovascular Study",
      "800 hours of Sleep Data collected",
      "1200 Genetic profiles analyzed for rare diseases",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Impact Feed",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: impactStories.length,
            itemBuilder: (context, index) {
              return _buildImpactCard(impactStories[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildImpactCard(String story) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(right: 12),
      elevation: 4,
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.local_activity, color: Colors.blueAccent, size: 30),
            const SizedBox(height: 12),
            Text(
              story,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "Read more",
              style: TextStyle(color: Colors.blue.shade600),
            ),
          ],
        ),
      ),
    );
  }

  /// Get Involved Button at the bottom of the screen
  Widget _buildGetInvolvedButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // Action for Get Involved button
          print("Get Involved tapped");
        },
        icon: const Icon(Icons.volunteer_activism, size: 24),
        label: const Text("Get Involved"),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          backgroundColor: Colors.blue.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
