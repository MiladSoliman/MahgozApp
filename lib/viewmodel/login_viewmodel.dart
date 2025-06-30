import 'package:minamakram/domin/login_useCase.dart';
import 'package:minamakram/models/user_entity.dart';

import '../domin/getBuildings_useCase.dart';

class LoginViewmodel {
  late LoginUseCaseImpl _useCaseImpl;
  LoginViewmodel() {
    _useCaseImpl = LoginUseCaseImpl();
  }

  Future<User> startLogin(
    String userName,
    String password,
  ) async {
    return await _useCaseImpl.request(userName: userName, password: password);
  }
}
