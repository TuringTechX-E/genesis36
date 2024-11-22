/// HealthData Model
/// Represents user's health metrics and AI-driven recommendations for improvement.
library;

class HealthData {
  final Map<String, double> metrics; // Stores metric name and current value
  final List<HealthRecommendation> recommendations;

  HealthData({
    required this.metrics,
    required this.recommendations,
  });
}

class HealthRecommendation {
  final String category;
  final String suggestion;

  HealthRecommendation({
    required this.category,
    required this.suggestion,
  });
}
