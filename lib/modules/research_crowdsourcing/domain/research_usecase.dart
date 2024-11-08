/// ResearchUseCase
/// Handles the business logic for displaying research projects, submitting health data,
/// and ensuring secure and anonymized data contributions.

import 'package:genesis360/modules/research_crowdsourcing/data/research_repository.dart';
import 'package:genesis360/modules/research_crowdsourcing/data/models/research_project_model.dart';
import 'package:genesis360/modules/research_crowdsourcing/data/models/health_data_model.dart';

class ResearchUseCase {
  final ResearchRepository _repository;

  ResearchUseCase(this._repository);

  // Fetches all available research projects
  Future<List<ResearchProject>> getResearchProjects() async {
    return await _repository.fetchResearchProjects();
  }

  // Submits anonymized health data to a specific research project
  Future<bool> contributeHealthData(HealthData data) async {
    return await _repository.submitHealthData(data);
  }
}
