/// Entity that holds data related to the user's sustainability metrics,
/// such as total carbon saved and eco-friendly actions completed.
library;

class SustainabilityEntity {
  final double totalCarbonSaved; // Total CO₂ saved in kg
  final int ecoActionsCompleted; // Number of eco-friendly actions

  SustainabilityEntity({
    required this.totalCarbonSaved,
    required this.ecoActionsCompleted,
  });

  // Creates a copy of this entity with optional updated fields.
  SustainabilityEntity copyWith({
    double? totalCarbonSaved,
    int? ecoActionsCompleted,
  }) {
    return SustainabilityEntity(
      totalCarbonSaved: totalCarbonSaved ?? this.totalCarbonSaved,
      ecoActionsCompleted: ecoActionsCompleted ?? this.ecoActionsCompleted,
    );
  }
}
