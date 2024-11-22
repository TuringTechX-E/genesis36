/// EnergyTradeRepository
///
/// This repository provides access to renewable energy credit (REC) trading data,
/// including:
///   - Real-time REC prices by energy type (e.g., solar, wind, hydro).
///   - Methods for submitting new REC trades with blockchain security.
///   - Tracking user trade histories for renewable energy contributions.
///
/// The repository enhances transparency by connecting with a blockchain-backed
/// system, allowing verification of each trade. It also supports live updates
/// on REC market prices to provide users with current trading opportunities.
///
/// Dependencies:
///   - Uses [energy_trade_api_client] for external API interactions.
///   - Leverages blockchain verification for transaction tracking.
library;

import 'package:genesis360/core/network/energy_trade_api_client.dart';
import 'package:genesis360/modules/blockchain/data/models/market_data_model.dart';
import 'package:genesis360/modules/blockchain/data/models/trade_model.dart';

class EnergyTradeRepository {
  final EnergyTradeApiClient _apiClient;

  EnergyTradeRepository(this._apiClient);

  /// Fetches real-time REC market prices for each renewable type.
  /// Market data includes:
  ///   - [solarPrice]: Current trading price of solar energy credits.
  ///   - [windPrice]: Current trading price of wind energy credits.
  ///   - [hydroPrice]: Current trading price of hydro energy credits.
  ///
  /// Returns a [Future] containing [MarketData] with the latest prices.
  Future<MarketData> fetchMarketPrices() async {
    final marketData = await _apiClient.getMarketPrices();
    return MarketData.fromJson(marketData);
  }

  /// Submits a new REC trade on the blockchain, recording:
  ///   - [type]: Type of energy trade (solar, wind, hydro).
  ///   - [amount]: Amount of energy credits being traded.
  ///   - [price]: Price per REC for the trade.
  ///   - [userId]: User identifier for tracking.
  ///
  /// The transaction is securely recorded with verification status from the blockchain.
  ///
  /// Returns a [Future] with a boolean indicating the success of the trade.
  Future<bool> submitTrade({
    required String type,
    required double amount,
    required double price,
    required String userId,
  }) async {
    final response = await _apiClient.submitTrade(
      {
        "type": type,
        "amount": amount,
        "price": price,
        "userId": userId,
        "timestamp": DateTime.now().toIso8601String(),
      },
    );

    return response['status'] == 'success';
  }

  /// Retrieves a user's trade history, providing details for each past trade,
  /// including:
  ///   - [id]: Unique trade identifier.
  ///   - [type]: Type of energy (solar, wind, hydro).
  ///   - [amount]: Amount traded.
  ///   - [price]: Price at the time of trade.
  ///   - [timestamp]: Date and time the trade was recorded.
  ///
  /// Returns a [Future] containing a list of [Trade] objects representing trade history.
  Future<List<Trade>> fetchUserTradeHistory(String userId) async {
    final tradeHistory = await _apiClient.getUserTradeHistory(userId);

    return tradeHistory.map((data) => Trade.fromJson(data)).toList();
  }
}
