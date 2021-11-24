import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Data/Remot/Api/dio_helper.dart';
import 'package:shopapp/Models/Login/login_model.dart';
import 'package:shopapp/Models/Search/search_model.dart';

import 'States.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialSearchState());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;
  void search({
    required String text,
  }) {
    emit(SearchLodaingState());

    DioHelper.postData(
      url: 'products/search',
      data: {
        "text": text,
      },
    ).then((value) {
      searchModel = SearchModel.fromjson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print({error.toString()});
      emit(SearchErrorState());
    });
  }
}
