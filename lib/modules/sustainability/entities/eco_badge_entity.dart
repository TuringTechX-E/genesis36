/// Entity for defining an eco badge, with a name, description, and requirements.

class EcoBadgeEntity {
  final String name;
  final String description;
  final int requirement; // Number of actions required to earn badge

  EcoBadgeEntity({
    required this.name,
    required this.description,
    required this.requirement,
  });
}
