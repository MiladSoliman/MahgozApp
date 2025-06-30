import 'package:flutter/cupertino.dart';

import '../models/avaliableTime/reservedTime_entity.dart';

class AvailableTimesProvider extends ChangeNotifier {

  List<ReservedTimeEntity> _timesList = [];

  List<ReservedTimeEntity>? get  timesList => _timesList ;


  void setTimesList(List<ReservedTimeEntity> buildings){
    _timesList = buildings;
    notifyListeners();
  }
}