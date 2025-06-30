import '../remote/getAvialableBuildingsByDates.dart';

abstract class GetBuildingsByDateRepo{
  Future getBuildingsByDate(
      String fromDate,
      String toDate
      );
}

class GetBuildingsByDateRepoImpl implements GetBuildingsByDateRepo {
  late GetAvailableBuildingsByDatesRemote _remote;

  GetBuildingsByDateRepoImpl({
    GetAvailableBuildingsByDatesRemote? remote
  })  {
    _remote = remote ?? GetAvailableBuildingsByDatesRemoteImpl();
  }


  @override
  Future getBuildingsByDate(
      String fromDate,
      String toDate
      ) async {
    return await _remote.getAvailableBuildingsByDate(fromDate, toDate);
  }
}