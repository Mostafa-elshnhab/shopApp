import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Data/Remot/Api/dio_helper.dart';
import 'package:shopapp/Models/Login/login_model.dart';

import 'States.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  LoginModel? LoginData;
  bool isShow = true;
  void ChangePasswordIcon() {
    isShow = !isShow;
    emit(ChangeRegisterPasswordState());
  }

  void Register(
      {required String name,
      required String email,
      required String phone,
      required String password}) {
    emit(RegisterLodaingState());

    DioHelper.postData(
      url: 'register',
      data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    ).then((value) {
      LoginData = LoginModel.fromJson(value.data);
      print(LoginData!.message);
      emit(RegisterSuccessState(LoginData));
    }).catchError((error) {
      print('sasa${error.toString()}');
      emit(RegisterErrorState());
    });
  }
}
