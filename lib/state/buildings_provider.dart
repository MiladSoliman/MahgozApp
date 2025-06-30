

import 'package:flutter/cupertino.dart';

import '../models/building_entity.dart';

class BuildingsProvider extends ChangeNotifier {

  List<Buildingg> _buildingsList = [];

  List<Buildingg>? get  buildingsList => _buildingsList ;


  void setBuildingsList(List<Buildingg> buildings){
    _buildingsList = buildings;
    notifyListeners();
  }
}