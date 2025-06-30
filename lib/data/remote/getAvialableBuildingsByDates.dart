import 'package:minamakram/common/mahgoz_Api.dart';

import '../../constants/api.dart';

abstract class GetAvailableBuildingsByDatesRemote {
  Future getAvailableBuildingsByDate(
      String fromDate,
      String toDate
      );
}

class GetAvailableBuildingsByDatesRemoteImpl implements GetAvailableBuildingsByDatesRemote {
  @override
  Future getAvailableBuildingsByDate(
      String fromDate,
      String toDate
      ) async {
    return MahgozApi().getAvailableBuildingsByDate(fromDate, toDate);
  }
}
