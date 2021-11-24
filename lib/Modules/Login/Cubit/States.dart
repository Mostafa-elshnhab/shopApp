import 'package:shopapp/Models/Login/login_model.dart';

abstract class LogiStates {}

class InitialLoginState extends LogiStates {}

class ChangePasswordState extends LogiStates {}

class LoginLodaingState extends LogiStates {}

class LoginScssesState extends LogiStates {
  final LoginModel? loginModel;

  LoginScssesState(this.loginModel);
}

class LoginErorrState extends LogiStates {}
