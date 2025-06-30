import 'package:minamakram/data/repo/login.dart';

abstract class LoginUseCase {
  Future request(
  {
    required String userName,
    required String password,
}
      );
}

class LoginUseCaseImpl implements LoginUseCase {
  late LoginRepo _loginRepo;

  LoginUseCaseImpl ({
    LoginRepo ? loginRepo
}) {
    _loginRepo = loginRepo ?? LoginRepoImpl();
  }

  @override
  Future request({required String userName, required String password}) async {
     try {
       return await _loginRepo.login(userName: userName, password: password);
     }catch (e) {
       return e;
     }
  }

}