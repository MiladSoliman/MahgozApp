import '../../models/avaliableTime/reservedTime_entity.dart';
import '../remote/getReservationHistory.dart';

abstract class GetReservationHistoryRepo {
  Future<List<ReservedTimeEntity>> getReservationHistory(String userId);
}

class GetReservationHistoryRepoImpl implements GetReservationHistoryRepo {
  late GetReservationHistoryRemote _remote;

  GetReservationHistoryRepoImpl({GetReservationHistoryRemoteImpl? remote}) {
    _remote = remote ?? GetReservationHistoryRemoteImpl();
  }

  @override
  Future<List<ReservedTimeEntity>> getReservationHistory(String userId) {
    return _remote.getReservationHistory(userId);
  }
}
