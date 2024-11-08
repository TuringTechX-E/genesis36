import 'package:flutter/material.dart';

class SpeciesTrackerWidget extends StatelessWidget {
  const SpeciesTrackerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Endangered Species Near You",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildSpeciesRow("African Elephant", "Population: 415,000"),
            _buildSpeciesRow("Mountain Gorilla", "Population: 1,000"),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeciesRow(String name, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyle(fontSize: 16)),
        Text(detail, style: TextStyle(fontSize: 16, color: Colors.blue)),
      ],
    );
  }
}
