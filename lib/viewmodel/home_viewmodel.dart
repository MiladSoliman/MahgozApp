
import 'package:flutter/cupertino.dart';
import 'package:minamakram/models/building_entity.dart';
import 'package:minamakram/utils/local_storge.dart';
import 'package:provider/provider.dart';

import '../domin/getBuildings_useCase.dart';
import '../state/buildings_provider.dart';

class HomeViewmodel {

  late GetBuildingsUseCaseImpl _buildingsUseCaseImpl;
    HomeViewmodel(){
      _buildingsUseCaseImpl = GetBuildingsUseCaseImpl();
    }

    Future <List<Buildingg>> getAllBuildings() async {
      return await _buildingsUseCaseImpl.request();
    }


  String?  getWarningMessage(){
    Future.delayed(Duration(seconds: 10));
    return "";
  }
}


class HomeController {
  HomeController();

  List<Buildingg> buildings = [];

final HomeViewmodel viewmodel =   HomeViewmodel();


  void setBuildingsList(List<Buildingg>? buildings){
    this.buildings = buildings! ;
  }


  Future getBuildings(BuildContext context) async {
    final BuildingsProvider buildingsProvider = Provider.of(context,listen: false);
      try {
       final buildingsList = await viewmodel.getAllBuildings();
       buildingsProvider.setBuildingsList(buildingsList);
      }catch (e){
        print(e);
      }
  }
}

