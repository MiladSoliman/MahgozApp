
import '../../common/mahgoz_Api.dart';

abstract class AddReservationRemote {
  Future addReservation(
    String roomId,
    String fromDate,
    String toDate,
    String userName,
      );
}

class AddReservationRemoteImpl implements AddReservationRemote {


  @override
  Future addReservation(String roomId, String fromDate, String toDate, String userName) {
    return MahgozApi().addReservation(
      roomId,
      fromDate,
      toDate,
      userName,
    );
  }
}