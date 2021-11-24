import 'package:dio/dio.dart';
import 'package:shopapp/Shared/componants/reusable/constants.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      headers: {
        'Content-Type': 'application/json',
      },
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required url,
    query,
    String lang = 'en',
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? "",
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    query,
    required Map<String, dynamic> data,
    String lang = 'ar',
  }) {
    dio!.options.headers = {'lang': lang, 'Authorization': token ?? ''};
    return dio!.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    query,
    required Map<String, dynamic> data,
    String lang = 'ar',
  }) {
    dio!.options.headers = {'lang': lang, 'Authorization': token ?? ''};
    return dio!.put(url, queryParameters: query, data: data);
  }
}
