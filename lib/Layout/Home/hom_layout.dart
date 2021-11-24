import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Modules/Search/search.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/cubit.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/states.dart';
import 'package:shopapp/Shared/componants/reusable/reusable%20components.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: 'Catigories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ]),
          appBar: AppBar(
            title: Text('salla'),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    NavtoAndFinsh(context, Search());
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          body: cubit.pages[cubit.currentIndex],
        );
      },
    );
  }
}
