import 'package:genesis360/modules/wildlife_guardian/data/wildlife_repository.dart';
import 'package:genesis360/modules/wildlife_guardian/data/wildlife_model.dart';

class WildlifeUseCase {
  final WildlifeRepository _repository;

  WildlifeUseCase(this._repository);

  Future<WildlifeData> getWildlifeData() async {
    return await _repository.fetchWildlifeData();
  }

  void reportSpeciesSighting(SpeciesSighting sighting) {
    _repository.reportSighting(sighting);
  }

  List<ConservationProject> filterProjectsByImpact(
      List<ConservationProject> projects, String impact) {
    return projects.where((project) => project.impact == impact).toList();
  }
}
