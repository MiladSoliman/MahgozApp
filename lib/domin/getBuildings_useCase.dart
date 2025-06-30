
import 'package:minamakram/Screens/LoginPage.dart';
import 'package:minamakram/data/repo/getBuildingsByDates.dart';

import '../data/repo/getAllBuildings.dart';

abstract class GetBuildingsUseCase {
  Future request();
}

class GetBuildingsUseCaseImpl implements GetBuildingsUseCase {
  late GetAllBuildingsRepo _getAllBuildingsRepo;

  GetBuildingsUseCaseImpl ({
    GetAllBuildingsRepo ? getAllBuildingsRepo
  }) {
    _getAllBuildingsRepo = getAllBuildingsRepo ?? GetAllBuildingsRepoImpl();
  }

  @override
  Future request() async {
    try {
      return await _getAllBuildingsRepo.getAllBuildings();
    }catch (e) {
      return e;
    }
  }
}

