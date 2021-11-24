import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Data/Remot/Api/dio_helper.dart';
import 'package:shopapp/Models/Favorite/edite_favorite.dart';
import 'package:shopapp/Models/Favorite/get_favo.dart';
import 'package:shopapp/Models/Home/home_models.dart';
import 'package:shopapp/Models/Login/login_model.dart';
import 'package:shopapp/Modules/Catigories/catigories.dart';
import '../../../Models/Catigories/catigories_model.dart';
import 'package:shopapp/Modules/Favorites/favorites.dart';
import 'package:shopapp/Modules/Home/home.dart';
import 'package:shopapp/Modules/Setinges/setinges.dart';
import 'package:shopapp/Shared/Cubit/AppCubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> pages = [
    Home(),
    Catigories(),
    Favorites(),
    Setting(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNaveChange());
  }

  Map<int, bool>? favorites = {};
  HomeModel? homeModel;
  void getData() {
    emit(HomeLoadingState());
    DioHelper.getData(
      url: 'home',
    ).then((value) {
      homeModel = HomeModel.fromjson(value.data);
      print(homeModel!.data!.bannerList[0].image);
      homeModel!.data!.productList.forEach((element) {
        favorites!.addAll({element.id!: element.in_favorites!});
      });
      print(favorites);
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }

  CatigoriesModel? catigoriesModel;
  void getCatData() {
    emit(HomeLoadingState());
    DioHelper.getData(
      url: 'categories',
    ).then((value) {
      catigoriesModel = CatigoriesModel.fromjson(value.data);
      emit(CatigoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CatigoriesErrorState());
    });
  }

  EditeFavoritModel? editeFavoritModel;
  void editFavorit(int id) {
    favorites![id] = !favorites![id]!;
    emit(ChangeFavState());
    DioHelper.postData(
      url: 'favorites',
      data: {'product_id': id},
    ).then((value) {
      editeFavoritModel = EditeFavoritModel.fromjson(value.data);
      print(editeFavoritModel!.message);
      getFav();
      emit(EditFavSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(EditFavErrorState());
    });
  }

  FavoritModel? favoritModel;
  void getFav() {
    DioHelper.getData(
      url: 'favorites',
    ).then((value) {
      favoritModel = FavoritModel.fromjson(value.data);
      print(favoritModel!.data!.favlist![0].productFavModel!.name);
      emit(GetFavSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavErrorState());
    });
  }

  LoginModel? userModel;
  void getProfile() {
    emit(ProfileLoadingState());
    DioHelper.getData(
      url: 'profile',
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      emit(ProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileErrorState());
    });
  }

  void updateProfile({required name, required phone, required email}) {
    emit(UpdateLoadingState());
    DioHelper.putData(
      url: 'update-profile',
      data: {
        "name": name,
        "phone": phone,
        "email": email,
      },
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      emit(UpdateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateErrorState());
    });
  }
}
