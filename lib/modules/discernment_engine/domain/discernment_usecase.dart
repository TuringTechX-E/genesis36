/// Discernment Use Case
/// This use case fetches, filters, and sorts AI-powered recommendations
/// based on relevance and user profile, generating prioritized insights.

import 'package:genesis360/modules/discernment_engine/data/discernment_repository.dart';
import 'package:genesis360/modules/discernment_engine/entities/ai_decision_entity.dart';

class DiscernmentUseCase {
  final DiscernmentRepository _repository;

  DiscernmentUseCase(this._repository);

  Future<List<AIDecision>> getPrioritizedRecommendations() async {
    List<AIDecision> prioritizedDecisions = [];

    final recommendations = await _repository.fetchAIRecommendations();

    // Simple relevance calculation; advanced implementations would use AI algorithms
    recommendations.forEach((rec) {
      double score = _calculateRelevanceScore(rec.category);
      prioritizedDecisions.add(AIDecision(
        category: rec.category,
        recommendation: rec.suggestion,
        relevanceScore: score,
      ));
    });

    // Sort by relevanceScore in descending order
    prioritizedDecisions
        .sort((a, b) => b.relevanceScore.compareTo(a.relevanceScore));
    return prioritizedDecisions;
  }

  // Calculate relevance based on category; simplified logic here
  double _calculateRelevanceScore(String category) {
    switch (category) {
      case 'Healthcare':
        return 0.9;
      case 'Sustainability':
        return 0.8;
      case 'Socioeconomic':
        return 0.7;
      default:
        return 0.5;
    }
  }
}
