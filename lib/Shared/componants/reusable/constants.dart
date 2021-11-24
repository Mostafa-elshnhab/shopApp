import 'package:shopapp/Data/Cash/cashHelper.dart';
import 'package:shopapp/Modules/Login/login.dart';
import 'package:shopapp/Shared/componants/reusable/reusable%20components.dart';

void logout(context) {
  CashHelper.removeData(key: 'token')
      .then((value) => NavtoAndFinsh(context, Login()));
}

String? token;
