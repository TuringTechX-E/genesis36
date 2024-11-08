import 'package:flutter/material.dart';

class ResearchProjectWidget extends StatelessWidget {
  const ResearchProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data; real implementation will pull from repository
    final projects = [
      {"title": "COVID-19 Long-Term Effects Study", "description": "Researching long-term effects of COVID-19."},
      {"title": "Heart Disease Genetic Study", "description": "Studying genetic factors in heart disease."},
    ];

    return Column(
      children: projects.map((project) => _buildProjectItem(project)).toList(),
    );
  }

  Widget _buildProjectItem(Map<String, String> project) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project["title"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(project["description"]!, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
