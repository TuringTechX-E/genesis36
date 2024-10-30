import 'package:genesis360/modules/home/data/home_repository.dart';
import 'package:genesis360/modules/home/data/home_model.dart';

class HomeUseCase {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  Future<HomeModel> getHomeData() async {
    return await _repository.fetchHomeData();
  }
}
