import 'package:minamakram/common/mahgoz_Api.dart';

abstract class LoginRemote {
  Future login({
    required String userName,
    required String password,
  });
}

class LoginRemoteImpl implements LoginRemote {
  @override
  Future login({
    required String userName,
    required String password,
  }) async {
    return MahgozApi().login(
      userName,
      password,
    );
  }
}
