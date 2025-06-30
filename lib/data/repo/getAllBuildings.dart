import 'package:minamakram/data/remote/login.dart';

import '../remote/getBuildings.dart';

abstract class GetAllBuildingsRepo{
  Future getAllBuildings();
}

class GetAllBuildingsRepoImpl implements GetAllBuildingsRepo {
  late GetBuildingsRemote _remote;

  GetAllBuildingsRepoImpl({
    GetBuildingsRemote? remote
  })  {
    _remote = remote ?? GetBuildingsRemoteImpl();
  }


  @override
  Future getAllBuildings() async {
    return await _remote.getBuildings();
  }
}



