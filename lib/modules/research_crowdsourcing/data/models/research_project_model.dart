/// ResearchProject Model
/// Represents a medical research project, including details such as title, description,
/// and unique identifier.

class ResearchProject {
  final String id;
  final String title;
  final String description;

  ResearchProject({
    required this.id,
    required this.title,
    required this.description,
  });
}
