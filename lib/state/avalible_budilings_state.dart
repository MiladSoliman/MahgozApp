import 'package:flutter/cupertino.dart';

import '../models/availableBuildings/avaliable_budilding_entity.dart';
import '../models/building_entity.dart';

class AvailableBuildingsProvider extends ChangeNotifier {

  List<AvaliableBuilding> _buildingsList = [];

  List<AvaliableBuilding>? get  buildingsList => _buildingsList ;


  void setBuildingsList(List<AvaliableBuilding> buildings){
    _buildingsList = buildings;
    notifyListeners();
  }
}