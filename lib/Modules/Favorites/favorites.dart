import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Models/Favorite/get_favo.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/cubit.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/states.dart';
import 'package:shopapp/Shared/componants/reusable/reusable%20components.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: cubit.favoritModel != null
                ? ListView.separated(
                    itemBuilder: (context, index) => productListItemBuilder(
                        model: cubit.favoritModel!.data!.favlist![index]
                            .productFavModel!,
                        favorites: cubit.favorites,
                        context: context),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: cubit.favoritModel!.data!.favlist!.length)
                : Center(child: CircularProgressIndicator()));
      },
    );
  }
}
