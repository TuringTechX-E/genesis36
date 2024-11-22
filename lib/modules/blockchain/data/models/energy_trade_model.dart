/// EnergyTrade Model
///
/// Represents an individual renewable energy trade in the marketplace, including:
///   - [tradeId]: Unique identifier for the energy trade.
///   - [type]: Type of energy (e.g., "Solar", "Wind", "Hydro") being traded.
///   - [amount]: The number of energy credits (e.g., kWh) in the trade.
///   - [price]: Price per credit for the trade.
///   - [timestamp]: Date and time the trade was recorded.
///   - [status]: Status of the trade on the blockchain (e.g., "Verified", "Pending").
///   - [origin]: Origin source of the renewable energy (e.g., "California Wind Farm").
///   - [carbonOffsetImpact]: Carbon offset impact for this trade, measured in kilograms of CO2.
///
/// This model includes JSON serialization methods for easy integration with the backend API,
/// as well as utility methods to facilitate filtering and sorting by trade type, status, or timestamp.
library;


class EnergyTrade {
  final String tradeId;               // Unique identifier for the trade
  final String type;                  // Type of renewable energy ("Solar", "Wind", "Hydro")
  final double amount;                // Amount of energy credits in the trade
  final double price;                 // Price per energy credit in the trade
  final DateTime timestamp;           // Timestamp of the trade
  final String status;                // Verification status (e.g., "Verified", "Pending")
  final String origin;                // Origin source of the energy (e.g., "Texas Solar Farm")
  final double carbonOffsetImpact;    // Carbon offset impact in kg CO2

  /// Constructor to initialize an [EnergyTrade] instance
  EnergyTrade({
    required this.tradeId,
    required this.type,
    required this.amount,
    required this.price,
    required this.timestamp,
    required this.status,
    required this.origin,
    required this.carbonOffsetImpact,
  });

  /// Factory method to create an [EnergyTrade] instance from JSON data.
  factory EnergyTrade.fromJson(Map<String, dynamic> json) {
    return EnergyTrade(
      tradeId: json['tradeId'],
      type: json['type'],
      amount: json['amount'].toDouble(),
      price: json['price'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
      status: json['status'],
      origin: json['origin'],
      carbonOffsetImpact: json['carbonOffsetImpact'].toDouble(),
    );
  }

  /// Converts an [EnergyTrade] instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'tradeId': tradeId,
      'type': type,
      'amount': amount,
      'price': price,
      'timestamp': timestamp.toIso8601String(),
      'status': status,
      'origin': origin,
      'carbonOffsetImpact': carbonOffsetImpact,
    };
  }

  /// Filters trades based on type (e.g., "Solar", "Wind", "Hydro").
  static List<EnergyTrade> filterByType(List<EnergyTrade> trades, String type) {
    return trades.where((trade) => trade.type == type).toList();
  }

  /// Sorts trades by timestamp in descending order.
  static List<EnergyTrade> sortByTimestampDescending(List<EnergyTrade> trades) {
    trades.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return trades;
  }

  /// Calculates the total carbon offset impact from a list of trades.
  static double calculateTotalCarbonOffset(List<EnergyTrade> trades) {
    return trades.fold(0.0, (sum, trade) => sum + trade.carbonOffsetImpact);
  }

  /// Returns a string representation of the energy trade details.
  @override
  String toString() {
    return 'EnergyTrade(tradeId: $tradeId, type: $type, amount: ${amount.toStringAsFixed(2)} kWh, '
           'price: \$${price.toStringAsFixed(2)}, status: $status, origin: $origin, '
           'carbonOffsetImpact: ${carbonOffsetImpact.toStringAsFixed(2)} kg CO2)';
  }
}
