import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Modules/Search/Cubit/States.dart';
import 'package:shopapp/Modules/Search/Cubit/cubit.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/cubit.dart';
import 'package:shopapp/Shared/componants/reusable/reusable%20components.dart';

class Search extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: 'Search',
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
                            return 'enter text to search';
                          } else
                            return null;
                        },
                        onChanged: (value) {
                          SearchCubit.get(context).search(text: value);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (state is SearchLodaingState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 12,
                      ),
                      if (state is SearchSuccessState)
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  productListItemBuilder(
                                    context: context,
                                    favorites: AppCubit.get(context).favorites,
                                    model: SearchCubit.get(context)
                                        .searchModel!
                                        .data!
                                        .productlist![index],
                                    isOldPrice: false,
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: SearchCubit.get(context)
                                  .searchModel!
                                  .data!
                                  .productlist!
                                  .length),
                        )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
