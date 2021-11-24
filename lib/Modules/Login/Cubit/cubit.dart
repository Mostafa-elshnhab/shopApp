import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Data/Remot/Api/dio_helper.dart';
import 'package:shopapp/Models/Login/login_model.dart';

import 'States.dart';

class LoginCubit extends Cubit<LogiStates> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? LoginData;
  bool isShow = true;
  void ChangePasswordIcon() {
    isShow = !isShow;
    emit(ChangePasswordState());
  }

  void Login({required email, required password}) {
    emit(LoginLodaingState());

    DioHelper.postData(
      url: 'login',
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      LoginData = LoginModel.fromJson(value.data);
      print(LoginData!.message);
      emit(LoginScssesState(LoginData));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErorrState());
    });
  }
}
