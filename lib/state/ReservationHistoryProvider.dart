import 'package:flutter/cupertino.dart';

import '../models/avaliableTime/reservedTime_entity.dart';

class ReservationHistoryProvider extends ChangeNotifier {

  List<ReservedTimeEntity> _reservationHistoryList = [];

  List<ReservedTimeEntity>? get  reservationHistoryList => _reservationHistoryList ;


  void setTimesList(List<ReservedTimeEntity> buildings){
    _reservationHistoryList = buildings;
    notifyListeners();
  }
}