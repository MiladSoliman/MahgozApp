
import 'package:minamakram/models/avaliableTime/reservedTime_entity.dart';

import '../data/repo/getAvailableDates.dart';

abstract class GetAvailableDatesUseCase {
  Future<List<ReservedTimeEntity>> getAvailableDates(String roomId);
}


class GetAvailableDatesUseCaseImpl implements GetAvailableDatesUseCase {
  late GetAvailableDatesRepo _repo;

  GetAvailableDatesUseCaseImpl({
    GetAvailableDatesRepo? addReservationRepo,
  }) {
    _repo = addReservationRepo ?? GetAvailableDatesRepoImpl();
  }

  @override
  Future<List<ReservedTimeEntity>> getAvailableDates(String roomId) {
    return _repo.getAvailableDates(roomId);
  }
}