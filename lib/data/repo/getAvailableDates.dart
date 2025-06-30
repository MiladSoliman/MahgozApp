import '../../models/avaliableTime/reservedTime_entity.dart';
import '../remote/getAvailabileDates.dart';

abstract class GetAvailableDatesRepo {
  Future<List<ReservedTimeEntity>> getAvailableDates(String roomId);
}

class GetAvailableDatesRepoImpl implements GetAvailableDatesRepo {
  late GetAvailableDatesRemote _remote;

  GetAvailableDatesRepoImpl({GetAvailableDatesRemote? remote}) {
    _remote = remote ?? GetAvailableDatesRemoteImpl();
  }

  @override
  Future<List<ReservedTimeEntity>> getAvailableDates(String roomId) {
    return _remote.getAvailableDates(roomId);
  }
}
