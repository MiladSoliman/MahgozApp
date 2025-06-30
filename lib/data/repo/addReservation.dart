
import '../remote/addReservation.dart';

abstract class AddReservationRepo {
  Future addReservation(
    String roomId,
    String fromDate,
    String toDate,
    String userName,
  );
}

class AddReservationRepoImpl implements AddReservationRepo {
  late AddReservationRemote _addReservationRemote;

  AddReservationRepoImpl({
    AddReservationRemote? addReservationRemote,
  }) {
    _addReservationRemote = addReservationRemote ?? AddReservationRemoteImpl();
  }

  @override
  Future addReservation(
    String roomId,
    String fromDate,
    String toDate,
    String userName,
  ) {
    return _addReservationRemote.addReservation(
      roomId,
      fromDate,
      toDate,
      userName,
    );
  }
}