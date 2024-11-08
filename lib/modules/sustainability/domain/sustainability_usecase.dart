/// Use case for handling the sustainability module's business logic,
/// including updating metrics, tracking carbon emissions, and awarding badges.

import '../data/sustainability_repository.dart';
import '../data/carbon_footprint_repository.dart';
import '../entities/sustainability_entity.dart';

class SustainabilityUseCase {
  final SustainabilityRepository _sustainabilityRepo;
  final CarbonFootprintRepository _carbonFootprintRepo;

  SustainabilityUseCase(this._sustainabilityRepo, this._carbonFootprintRepo);

  /// Calculates and updates the user's carbon footprint.
  Future<void> updateCarbonFootprint(int electricityUsage, int milesDriven) async {
    double carbonFootprint = _carbonFootprintRepo.calculateCarbonFootprint(electricityUsage, milesDriven);

    // Retrieve the latest sustainability metrics
    SustainabilityEntity currentMetrics = await _sustainabilityRepo.fetchSustainabilityMetrics();

    // Update metrics and store back
    SustainabilityEntity updatedMetrics = currentMetrics.copyWith(
      totalCarbonSaved: currentMetrics.totalCarbonSaved - carbonFootprint,
    );

    await _sustainabilityRepo.updateSustainabilityMetrics(updatedMetrics);
  }
}
