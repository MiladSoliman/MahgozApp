
import '../domin/addReservation_useCase.dart';

abstract class AddReservationViewModel {
  Future addReservation(
    String roomId,
    String fromDate,
    String toDate,
    String userName,
  );
}

class AddReservationViewModelImpl implements AddReservationViewModel {


  late final AddReservationUseCase _addReservationUseCase;

  AddReservationViewModelImpl(){
    _addReservationUseCase = AddReservationUseCaseImpl();
  }
  @override
  Future addReservation(
    String roomId,
    String fromDate,
    String toDate,
    String userName,
  ) {
    return _addReservationUseCase.addReservation(
      roomId,
      fromDate,
      toDate,
      userName,
    );
  }
}