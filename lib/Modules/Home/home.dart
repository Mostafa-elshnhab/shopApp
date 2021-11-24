import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Models/Catigories/catigories_model.dart';
import 'package:shopapp/Models/Home/home_models.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/cubit.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/states.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.homeModel != null && cubit.catigoriesModel != null
              ? productPuilder(cubit.homeModel!, cubit.catigoriesModel!,
                  cubit.favorites, context)
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget productPuilder(
      HomeModel model, CatigoriesModel catModel, favorites, context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model.data!.bannerList
                  .map((e) => Image.network(
                        e.image!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 1),
                enableInfiniteScroll: true,
                height: 200,
                reverse: false,
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Categories',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => catpuilder(catModel, index),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                  itemCount: catModel.data!.dataList.length),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'New Products',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1 / 1.5,
                  children: List.generate(
                      model.data!.productList.length,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [
                                  Image.network(
                                    model.data!.productList[index].image!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 150,
                                  ),
                                  if (model.data!.productList[index].discount !=
                                      0)
                                    Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          'Discount',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              Text(
                                model.data!.productList[index].name!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${model.data!.productList[index].price}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.lightBlueAccent),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  if (model.data!.productList[index].discount !=
                                      0)
                                    Text(
                                      '${model.data!.productList[index].old_price}',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  Spacer(),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: favorites[
                                            model.data!.productList[index].id!]
                                        ? Colors.lightBlue
                                        : Colors.grey,
                                    child: IconButton(
                                        onPressed: () {
                                          AppCubit.get(context).editFavorit(
                                              model.data!.productList[index]
                                                  .id!);
                                        },
                                        icon: Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              )
                            ],
                          )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget catpuilder(CatigoriesModel model, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 100,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.network(
                model.data!.dataList[index].image!,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.black.withOpacity(.6),
                width: 100,
                child: Text(
                  model.data!.dataList[index].name!,
                  style: TextStyle(fontSize: 11, color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      );
}
