import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/Home/hom_layout.dart';
import 'package:shopapp/Modules/Login/login.dart';

import 'Data/Cash/cashHelper.dart';
import 'Data/Remot/Api/dio_helper.dart';
import 'Layout/onboarding_page/onboarding.dart';
import 'Shared/Cubit/AppCubit/cubit.dart';
import 'Shared/Cubit/cubit_observe.dart';
import 'Shared/componants/reusable/constants.dart';
import 'Style/Themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  dynamic isBoarding = CashHelper.getBoarding('isBoarding') ?? false;
  token = CashHelper.getToken('token');
  print(token);
  bool? isLogin;
  if (token != null)
    isLogin = true;
  else
    isLogin = false;
  Widget startWidget;
  if (isBoarding) {
    if (isLogin)
      startWidget = HomeLayout();
    else
      startWidget = Login();
  } else
    startWidget = OnBoarding();
  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  Widget? startWidget;
  MyApp(
    this.startWidget,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getData()
        ..getCatData()
        ..getFav()
        ..getProfile(),
      child: MaterialApp(
          title: 'Shop App',
          debugShowCheckedModeBanner: false,
          theme: Themes.themeData(false),
          home: startWidget),
    );
  }
}
