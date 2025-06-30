import '../data/repo/getBuildingsByDates.dart';

abstract class GetBuildingsByDateUseCase {
  Future request(
      String fromDate,
      String toDate
      );
}

class GetBuildingsByDateUseCaseImpl implements GetBuildingsByDateUseCase {
  late GetBuildingsByDateRepo _getBuildingsByDateRepo;

  GetBuildingsByDateUseCaseImpl ({
    GetBuildingsByDateRepo ? getBuildingByDateRepo
  }) {
    _getBuildingsByDateRepo = getBuildingByDateRepo ?? GetBuildingsByDateRepoImpl();
  }

  @override
  Future request(
      String fromDate,
      String toDate
      ) async {
    try {
      return await _getBuildingsByDateRepo.getBuildingsByDate(fromDate, toDate);
    }catch (e) {
      return e;
    }
  }
}