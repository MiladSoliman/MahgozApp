
import 'package:minamakram/data/repo/getReservationHistory.dart';
import 'package:minamakram/models/avaliableTime/reservedTime_entity.dart';


abstract class GetReservationHistoryUseCase {
  Future<List<ReservedTimeEntity>> getReservationHistory(String userId);
}


class GetReservationHistoryUseCaseImpl implements GetReservationHistoryUseCase {
  late GetReservationHistoryRepo _repo;

  GetReservationHistoryUseCaseImpl({
    GetReservationHistoryRepo? repo,
  }) {
    _repo = repo ?? GetReservationHistoryRepoImpl();
  }

  @override
  Future<List<ReservedTimeEntity>> getReservationHistory(String userId) {
    return _repo.getReservationHistory(userId);
  }
}