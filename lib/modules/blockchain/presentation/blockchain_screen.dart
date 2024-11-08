import 'package:flutter/material.dart';
import 'widgets/transaction_record_widget.dart';
import 'widgets/transparency_overview_widget.dart';
import 'widgets/live_market_widget.dart';

class BlockchainScreen extends StatelessWidget {
  const BlockchainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blockchain Transparency"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransactionRecordWidget(),       // Shows a list of recent transactions
            SizedBox(height: 20),
            TransparencyOverviewWidget(),    // Displays overall transparency metrics
            SizedBox(height: 20),
            LiveMarketWidget(),              // Displays live REC market values
          ],
        ),
      ),
    );
  }
}
