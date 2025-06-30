import 'package:minamakram/data/remote/login.dart';

abstract class LoginRepo{


  Future login({
    required String userName,
    required String password,
  });
}

class LoginRepoImpl implements LoginRepo {
  late LoginRemote _remote;

  LoginRepoImpl({
    LoginRemote? remote
}) {
    _remote = remote ?? LoginRemoteImpl();
  }


  @override
  Future login({required String userName, required String password}) async {
   return await _remote.login(userName: userName, password: password);
  }
}