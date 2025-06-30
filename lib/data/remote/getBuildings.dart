import 'package:minamakram/common/mahgoz_Api.dart';


abstract class GetBuildingsRemote {
  Future getBuildings();
}

class GetBuildingsRemoteImpl implements GetBuildingsRemote {
  @override
  Future getBuildings() async {
    return MahgozApi().getAllBuildings();
  }
}
