/// BlockchainRepository
///
/// This repository manages interactions with blockchain-backed renewable energy
/// transaction data, live REC market information, and user impact metrics.
/// It provides methods to:
///   - Fetch blockchain transaction records with full transparency.
///   - Retrieve live market data for renewable energy credits (RECs).
///   - Calculate and update user-specific carbon impact scores based on trades.
///
/// The repository is organized to support:
///   - **Transactional Security**: Ensures each transaction is securely fetched
///     with verification status and blockchain-origin metadata.
///   - **Data Organization**: Structures data for displaying REC types, transaction
///     origins, timestamps, and carbon impact metrics in a user-friendly interface.
///   - **Market Updates**: Tracks real-time market trends for solar, wind, and hydro RECs.
///
/// Dependencies:
///   - Uses [blockchain_api_client] for API calls to the blockchain network.
///   - Uses a caching mechanism to handle user-specific carbon impact metrics.
library;

import 'package:genesis360/core/network/blockchain_api_client.dart';
import 'package:genesis360/modules/blockchain/data/models/transaction_model.dart';
import 'package:genesis360/modules/blockchain/data/models/market_data_model.dart';
import 'package:genesis360/modules/blockchain/data/models/user_impact_model.dart';

class BlockchainRepository {
  final BlockchainApiClient _apiClient;

  BlockchainRepository(this._apiClient);

  /// Fetches a list of blockchain-secured transactions related to REC trading.
  /// Each transaction includes metadata such as:
  ///   - [id]: Unique transaction identifier.
  ///   - [type]: Renewable energy type (e.g., solar, wind, hydro).
  ///   - [amount]: Energy or carbon offset amount.
  ///   - [timestamp]: Date and time of the transaction.
  ///   - [status]: Verification status from the blockchain.
  ///
  /// Returns a [Future] containing a list of [Transaction] objects.
  Future<List<Transaction>> fetchTransactions() async {
    final transactionData = await _apiClient.getTransactions();

    return transactionData.map((data) => Transaction.fromJson(data)).toList();
  }

  /// Retrieves live REC market data, providing current price trends for each type:
  ///   - [solarPrice]: Market price for solar RECs.
  ///   - [windPrice]: Market price for wind RECs.
  ///   - [hydroPrice]: Market price for hydro RECs.
  ///
  /// Returns a [Future] containing a [MarketData] object with real-time values.
  Future<MarketData> fetchMarketData() async {
    final marketData = await _apiClient.getMarketData();
    return MarketData.fromJson(marketData);
  }

  /// Calculates the user’s carbon impact score based on their energy trades,
  /// adjusting for the carbon offset amount and energy type. The score is visualized
  /// in the UI and reflected by the growth of a leaf icon symbolizing impact.
  ///
  ///   - [transactions]: List of user's transactions, specifically filtering REC trades.
  ///
  /// Returns a [Future] with a [UserImpact] object containing the calculated score.
  Future<UserImpact> calculateUserImpact(List<Transaction> transactions) async {
    double totalCarbonOffset = 0.0;

    for (var transaction in transactions) {
      if (transaction.type == 'Carbon Offset') {
        totalCarbonOffset += transaction.amount;
      }
    }

    return UserImpact(score: totalCarbonOffset);
  }

  /// Submits a user-specific REC trade transaction to the blockchain network,
  /// ensuring secure storage and verification of the data.
  ///
  ///   - [type]: Renewable type of the trade (solar, wind, hydro).
  ///   - [amount]: Amount of REC or offset units.
  ///   - [userId]: User ID associated with the transaction.
  ///
  /// Returns a [Future] with a boolean indicating success or failure of the operation.
  Future<bool> submitTransaction({
    required String type,
    required double amount,
    required String userId,
  }) async {
    final response = await _apiClient.submitTransaction(
      {
        "type": type,
        "amount": amount,
        "userId": userId,
        "timestamp": DateTime.now().toIso8601String(),
      },
    );

    return response['status'] == 'success';
  }
}
