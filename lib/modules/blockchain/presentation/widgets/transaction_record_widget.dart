import 'package:flutter/material.dart';

/// A widget to display individual transaction records with relevant details.
///
/// Each transaction shows:
///   - Transaction ID
///   - Type of transaction (e.g., "Energy Trade", "Carbon Offset")
///   - Amount involved (e.g., "500 kWh" or "300 kg CO2")
///   - Status of the transaction (e.g., "Verified", "Pending")
///
/// This widget accepts transaction data passed to it, allowing reuse and flexibility.
class TransactionRecordWidget extends StatelessWidget {
  final String id;
  final String type;
  final String amount;
  final String status;

  const TransactionRecordWidget({
    super.key,
    required this.id,
    required this.type,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transaction ID: $id",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  status == 'Verified' ? Icons.verified : Icons.pending,
                  color: status == 'Verified' ? Colors.green : Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("Type: $type", style: const TextStyle(fontSize: 16)),
            Text("Amount: $amount", style: const TextStyle(fontSize: 16)),
            Text("Status: $status", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
