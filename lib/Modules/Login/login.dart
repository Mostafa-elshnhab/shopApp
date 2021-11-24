import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/Data/Cash/cashHelper.dart';
import 'package:shopapp/Layout/Home/hom_layout.dart';
import 'package:shopapp/Modules/Login/Cubit/cubit.dart';
import 'package:shopapp/Modules/Register/register.dart';
import 'package:shopapp/Shared/componants/reusable/constants.dart';
import 'package:shopapp/Shared/componants/reusable/reusable%20components.dart';

import 'Cubit/States.dart';

class Login extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LogiStates>(
        listener: (context, state) {
          if (state is LoginScssesState) {
            if (state.loginModel!.status!) {
              token = state.loginModel!.data!.token;
              CashHelper.saveData(key: 'token', value: token)
                  .then((value) => NavtoAndFinsh(context, HomeLayout()));
            } else {
              Fluttertoast.showToast(
                  msg: state.loginModel!.message!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login To See All Products And Offers',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email can\'t be empty';
                            } else
                              return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: LoginCubit.get(context).isShow,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  LoginCubit.get(context).ChangePasswordIcon();
                                },
                                icon: Icon(Icons.remove_red_eye)),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password can\'t be empty';
                            } else
                              return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        (state is! LoginLodaingState)
                            ? MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).Login(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                color: Colors.lightBlueAccent,
                                minWidth: double.infinity,
                                height: 50,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Center(child: CircularProgressIndicator()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have account ?'),
                            TextButton(
                                onPressed: () {
                                  Navto(context, Register());
                                },
                                child: Text('REGISTER')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
