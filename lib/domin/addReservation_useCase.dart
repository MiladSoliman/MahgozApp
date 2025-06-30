
import '../data/repo/addReservation.dart';

abstract class AddReservationUseCase {
  Future addReservation(
    String roomId,
    String fromDate,
    String toDate,
    String userName,
  );
}

class AddReservationUseCaseImpl implements AddReservationUseCase {
  late AddReservationRepo _addReservationRepo;

  AddReservationUseCaseImpl({
    AddReservationRepo? addReservationRepo,
  }) {
    _addReservationRepo = addReservationRepo ?? AddReservationRepoImpl();
  }

  @override
  Future addReservation(
    String roomId,
    String fromDate,
    String toDate,
    String userName,
  ) {
    return _addReservationRepo.addReservation(
      roomId,
      fromDate,
      toDate,
      userName,
    );
  }
}