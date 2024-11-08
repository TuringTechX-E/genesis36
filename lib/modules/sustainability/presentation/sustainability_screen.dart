/// Main screen for the Personal Sustainability Journey, displaying
/// progress bars, badges, and actionable eco-tips.

import 'package:flutter/material.dart';
import 'widgets/carbon_footprint_widget.dart';
import 'widgets/eco_badges_widget.dart';
import 'widgets/sustainability_tips_widget.dart';

class SustainabilityScreen extends StatelessWidget {
  const SustainabilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sustainability Journey')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarbonFootprintWidget(),
          EcoBadgesWidget(),
          SustainabilityTipsWidget(),
        ],
      ),
    );
  }
}
