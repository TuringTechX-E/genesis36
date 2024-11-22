/// Healthcare Use Case
/// Manages AI recommendations, goal tracking, and progress monitoring for health metrics.
library;

import 'package:genesis360/modules/healthcare/data/healthcare_repository.dart';
import 'package:genesis360/modules/healthcare/entities/healthcare_entity.dart';

class HealthcareUseCase {
  final HealthcareRepository _repository;

  HealthcareUseCase(this._repository);

  Future<HealthData> getUserHealthData() async {
    return await _repository.fetchUserHealthData();
  }

  // Method to update or adjust health goals based on user input
  HealthGoal setGoal(String category, double targetValue) {
    return HealthGoal(category: category, target: targetValue, currentProgress: 0.0);
  }
}
