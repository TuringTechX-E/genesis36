/// Repository for calculating and storing the user's carbon footprint.
/// 
/// This repository can fetch data from an API, calculate estimates,
/// and cache recent calculations for performance.

import '../entities/sustainability_entity.dart';

class CarbonFootprintRepository {
  /// Calculates the carbon footprint based on user activities.
  /// The algorithm uses activity factors to estimate emissions.
  double calculateCarbonFootprint(int electricityUsage, int milesDriven) {
    const double electricityFactor = 0.92; // kg CO₂ per kWh
    const double milesFactor = 0.404; // kg CO₂ per mile driven
    
    return (electricityUsage * electricityFactor) + (milesDriven * milesFactor);
  }
}
