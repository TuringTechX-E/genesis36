/// BlockchainUseCase
/// Provides business logic for managing and displaying blockchain transactions,
/// including filtering by status and sorting by timestamp for transparency.

import 'package:genesis360/modules/blockchain/data/blockchain_repository.dart';
import 'package:genesis360/modules/blockchain/data/models/transaction_model.dart';

class BlockchainUseCase {
  final BlockchainRepository _repository;

  BlockchainUseCase(this._repository);

  Future<List<Transaction>> getVerifiedTransactions() async {
    List<Transaction> allTransactions = await _repository.fetchTransactions();
    return allTransactions.where((tx) => tx.status == 'Verified').toList();
  }

  List<Transaction> sortTransactionsByDate(List<Transaction> transactions) {
    transactions.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return transactions;
  }
}
