import 'package:flutter/material.dart';
import 'package:genesis360/modules/blockchain/data/models/energy_trade_model.dart';
import 'package:genesis360/modules/blockchain/data/models/carbon_offset_model.dart';
import 'package:genesis360/modules/blockchain/presentation/widgets/transaction_record_widget.dart';
import 'package:genesis360/modules/blockchain/presentation/widgets/energy_market_widget.dart';
import 'package:genesis360/modules/blockchain/presentation/widgets/impact_score_widget.dart';

/// BlockchainScreen
/// 
/// The main UI screen for displaying blockchain-secured renewable energy trades and transparency data.
/// This screen includes:
///   - Transaction Feed: A scrollable list of recent energy trades, showing details like type, amount, price, timestamp, and verification status.
///   - Live Energy Market: A dynamic, color-coded line graph showing REC market values for solar, wind, and hydro energy.
///   - Impact Score Meter: A graphical display of the user’s overall carbon offset contribution with a growing "leaf" icon as the impact score increases.
///
/// UI follows Flutter best practices and utilizes modular widget design for easy readability and maintenance.

class BlockchainScreen extends StatelessWidget {
  const BlockchainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blockchain Energy Market"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: _buildTransactionFeedSection(),
          ),
          const Divider(),
          Expanded(
            flex: 2,
            child: _buildLiveMarketAndImpactSection(),
          ),
        ],
      ),
    );
  }

  /// Builds the Transaction Feed Section, displaying recent blockchain-secured trades.
  /// The feed shows each trade's type, amount, price, and status.
  Widget _buildTransactionFeedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Recent Transactions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<EnergyTrade>>(
            future: fetchRecentTransactions(), // Replace with your data source method
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Error loading transactions"));
              }
              final transactions = snapshot.data ?? [];
              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionRecordWidget(transaction: transactions[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  /// Builds the Live Energy Market and Impact Score Section.
  /// Displays a color-coded line graph of REC prices and an impact score meter.
  Widget _buildLiveMarketAndImpactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Live Energy Market",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: FutureBuilder<Map<String, double>>(
            future: fetchLiveMarketPrices(), // Replace with your data source method
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Error loading market data"));
              }
              final marketData = snapshot.data ?? {};
              return EnergyMarketWidget(marketData: marketData);
            },
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Your Carbon Offset Contribution",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder<double>(
          future: calculateUserImpactScore(), // Replace with your data source method
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Error loading impact score"));
            }
            final impactScore = snapshot.data ?? 0.0;
            return ImpactScoreWidget(impactScore: impactScore);
          },
        ),
      ],
    );
  }
}
