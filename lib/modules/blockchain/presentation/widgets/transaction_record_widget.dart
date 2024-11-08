import 'package:flutter/material.dart';

class TransactionRecordWidget extends StatelessWidget {
  const TransactionRecordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mocked transaction data; real implementation would use data from repository
    final transactions = [
      {"id": "TX123456", "type": "Energy Trade", "amount": "500 kWh", "status": "Verified"},
      {"id": "TX123457", "type": "Carbon Offset", "amount": "300 kg CO2", "status": "Pending"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: transactions.map((tx) => _buildTransactionItem(tx)).toList(),
    );
  }

  Widget _buildTransactionItem(Map<String, String> tx) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Transaction ID: ${tx['id']}", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Type: ${tx['type']}"),
            Text("Amount: ${tx['amount']}"),
            Text("Status: ${tx['status']}"),
          ],
        ),
      ),
    );
  }
}
