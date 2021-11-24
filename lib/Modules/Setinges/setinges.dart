import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/cubit.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/states.dart';
import 'package:shopapp/Shared/componants/reusable/constants.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var formKey = GlobalKey<FormState>();
        nameController.text = cubit.userModel!.data!.name!;
        emailController.text = cubit.userModel!.data!.email!;
        phoneController.text = cubit.userModel!.data!.phone!;
        return Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (state is UpdateLoadingState) LinearProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(cubit.userModel!.data!.image!),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
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
                        return 'Name can\'t be empty';
                      } else
                        return null;
                    },
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
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Phone',
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
                        return 'Phone can\'t be empty';
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      logout(context);
                    },
                    color: Colors.lightBlueAccent,
                    minWidth: double.infinity,
                    height: 50,
                    child: Text(
                      'LogOut',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AppCubit.get(context).updateProfile(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text);
                      }
                    },
                    color: Colors.lightBlueAccent,
                    minWidth: double.infinity,
                    height: 50,
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
