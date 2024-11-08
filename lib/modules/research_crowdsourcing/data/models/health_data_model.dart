/// HealthData Model
/// Represents user-contributed health data with details including data type, value,
/// and timestamp for secure submission.

class HealthData {
  final String type;
  final double value;
  final DateTime timestamp;

  HealthData({
    required this.type,
    required this.value,
    required this.timestamp,
  });
}
