import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../domin/getBuidlingByDate_useCase.dart';
import '../models/availableBuildings/avaliable_budilding_entity.dart';
import '../models/building_entity.dart';
import '../state/avalible_budilings_state.dart';

class GetBuildingsByDateViewmodel {
  late GetBuildingsByDateUseCaseImpl _getBuildingsByDateUseCaseImpl;
  GetBuildingsByDateViewmodel() {
    _getBuildingsByDateUseCaseImpl = GetBuildingsByDateUseCaseImpl();
  }

  Future<List<AvaliableBuilding>> getBuildingsByDate(
      String fromDate, String toDate) async {
    return await _getBuildingsByDateUseCaseImpl.request(fromDate, toDate);
  }
}

class GetBuildingsByDateController {
  GetBuildingsByDateController();

  List<AvaliableBuilding> buildings = [];

  final GetBuildingsByDateViewmodel viewmodel = GetBuildingsByDateViewmodel();

  void setAvailableBuildings(List<AvaliableBuilding>? buildings) {
    this.buildings = buildings!;
  }

  Future getAvailableBuildingsByDate(
      BuildContext context, String? fromDate, String? toDate) async {
    final AvailableBuildingsProvider buildingsProvider =
        Provider.of(context, listen: false);
    try {
      final buildingsList =
          await viewmodel.getBuildingsByDate(fromDate!, toDate!);
      buildingsProvider.setBuildingsList(buildingsList);
    } catch (e) {
      print(e);
    }
  }
}
