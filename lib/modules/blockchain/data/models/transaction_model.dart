/// Transaction Model
/// Represents a blockchain transaction with associated metadata such as ID, type,
/// amount, timestamp, and status to provide transparency in blockchain dealings.
library;

class Transaction {
  final String id;
  final String type;
  final double amount;
  final DateTime timestamp;
  final String status;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.timestamp,
    required this.status,
  });
}
