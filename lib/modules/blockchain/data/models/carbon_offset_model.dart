/// CarbonOffset Model
///
/// This model represents a carbon offset activity related to renewable energy trades,
/// including key data for tracking carbon reduction contributions. Fields include:
///   - [offsetId]: Unique identifier for each carbon offset entry.
///   - [type]: Type of offset activity (e.g., "Reforestation", "Energy Efficiency", "Solar Energy").
///   - [amount]: Amount of carbon offset achieved, measured in kilograms of CO2.
///   - [timestamp]: Date and time of the carbon offset activity.
///   - [status]: Verification status of the carbon offset (e.g., "Verified", "Pending").
///   - [projectOrigin]: Origin or source project responsible for the offset (e.g., "Amazon Reforestation Project").
///   - [source]: The country, organization, or initiative behind the offset (e.g., "World Wildlife Fund").
///
/// The model includes JSON serialization for seamless API interaction and utility methods
/// for calculating total offsets and filtering by type or status.
library;


class CarbonOffset {
  final String offsetId;               // Unique identifier for the carbon offset entry
  final String type;                   // Type of offset activity ("Reforestation", "Solar Energy", etc.)
  final double amount;                 // Amount of CO2 offset in kg
  final DateTime timestamp;            // Date and time the offset was recorded
  final String status;                 // Verification status ("Verified", "Pending", etc.)
  final String projectOrigin;          // Name or location of the offset project
  final String source;                 // Organization or country providing the offset

  /// Constructor to initialize a [CarbonOffset] instance.
  CarbonOffset({
    required this.offsetId,
    required this.type,
    required this.amount,
    required this.timestamp,
    required this.status,
    required this.projectOrigin,
    required this.source,
  });

  /// Factory method to create a [CarbonOffset] instance from JSON data.
  factory CarbonOffset.fromJson(Map<String, dynamic> json) {
    return CarbonOffset(
      offsetId: json['offsetId'],
      type: json['type'],
      amount: json['amount'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
      status: json['status'],
      projectOrigin: json['projectOrigin'],
      source: json['source'],
    );
  }

  /// Converts a [CarbonOffset] instance into a JSON-compatible map.
  Map<String, dynamic> toJson() {
    return {
      'offsetId': offsetId,
      'type': type,
      'amount': amount,
      'timestamp': timestamp.toIso8601String(),
      'status': status,
      'projectOrigin': projectOrigin,
      'source': source,
    };
  }

  /// Filters carbon offsets by type (e.g., "Reforestation", "Solar Energy").
  static List<CarbonOffset> filterByType(List<CarbonOffset> offsets, String type) {
    return offsets.where((offset) => offset.type == type).toList();
  }

  /// Filters carbon offsets by verification status (e.g., "Verified", "Pending").
  static List<CarbonOffset> filterByStatus(List<CarbonOffset> offsets, String status) {
    return offsets.where((offset) => offset.status == status).toList();
  }

  /// Calculates the total carbon offset from a list of offsets.
  static double calculateTotalOffset(List<CarbonOffset> offsets) {
    return offsets.fold(0.0, (sum, offset) => sum + offset.amount);
  }

  /// Returns a formatted string summarizing the carbon offset details.
  @override
  String toString() {
    return 'CarbonOffset(offsetId: $offsetId, type: $type, amount: ${amount.toStringAsFixed(2)} kg CO2, '
           'status: $status, projectOrigin: $projectOrigin, source: $source)';
  }
}
