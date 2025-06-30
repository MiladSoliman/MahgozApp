

import 'package:minamakram/models/avaliableTime/reservedTime_entity.dart';

import '../../common/mahgoz_Api.dart';

abstract class GetAvailableDatesRemote {
  Future<List<ReservedTimeEntity>> getAvailableDates(String roomId);
}


class GetAvailableDatesRemoteImpl implements GetAvailableDatesRemote {
  @override
  Future<List<ReservedTimeEntity>> getAvailableDates(String roomId) {
    return MahgozApi().getAvailableDates(roomId);
  }
}
