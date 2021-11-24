import 'package:shopapp/Models/Login/login_model.dart';

abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class ChangeRegisterPasswordState extends RegisterStates {}

class RegisterLodaingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final LoginModel? loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates {}
