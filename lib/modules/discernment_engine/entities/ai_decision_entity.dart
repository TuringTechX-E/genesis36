/// AIDecision Entity
/// Represents an AI-generated decision insight, including category, recommendation,
/// and relevance score to help prioritize suggestions.
library;

class AIDecision {
  final String category;
  final String recommendation;
  final double relevanceScore; // AI-driven relevance score based on user profile

  AIDecision({
    required this.category,
    required this.recommendation,
    required this.relevanceScore,
  });
}
