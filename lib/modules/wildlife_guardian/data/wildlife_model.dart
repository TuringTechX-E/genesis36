class WildlifeData {
  final List<Species> species;
  final List<ConservationProject> conservationProjects;

  WildlifeData({
    required this.species,
    required this.conservationProjects,
  });
}

class Species {
  final String name;
  final String status;
  final int population;

  Species({
    required this.name,
    required this.status,
    required this.population,
  });
}

class ConservationProject {
  final String name;
  final String location;
  final String impact;

  ConservationProject({
    required this.name,
    required this.location,
    required this.impact,
  });
}

class SpeciesSighting {
  final String speciesName;
  final String location;
  final DateTime timestamp;
  final String imageUrl;

  SpeciesSighting({
    required this.speciesName,
    required this.location,
    required this.timestamp,
    required this.imageUrl,
  });
}
