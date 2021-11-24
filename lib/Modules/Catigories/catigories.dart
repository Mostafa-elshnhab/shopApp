import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/cubit.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/states.dart';

class Catigories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
              itemBuilder: (context, index) => Row(
                    children: [
                      Image.network(
                        cubit.catigoriesModel!.data!.dataList[index].image!,
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(cubit.catigoriesModel!.data!.dataList[index].name!),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right_rounded)),
                    ],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
              itemCount: cubit.catigoriesModel!.data!.dataList.length),
        ));
      },
    );
  }
}
