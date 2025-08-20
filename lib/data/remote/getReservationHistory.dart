

import 'package:minamakram/models/avaliableTime/reservedTime_entity.dart';

import '../../common/mahgoz_Api.dart';

abstract class GetReservationHistoryRemote {
  Future<List<ReservedTimeEntity>> getReservationHistory(String userId);
}


class GetReservationHistoryRemoteImpl implements GetReservationHistoryRemote {
  @override
  Future<List<ReservedTimeEntity>> getReservationHistory(String userId) {
    return MahgozApi().getReservationHistory(userId);
  }
}
