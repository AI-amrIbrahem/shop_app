import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/resoruces/constants.dart';

class DioHelper {
  static late Dio dio;

  static final DioHelper _instance = DioHelper.internal();

  factory DioHelper() {
    return _instance;
  }

  DioHelper.internal() {
    createDio();
  }

  void createDio() {
    dio = Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
      String lang = "ar",
      String? token}) async {
    dio.options.headers = {"lang": lang, "Authorization": token,        'Content-Type': 'application/json',
    };
    return await dio.post(url, data: data, queryParameters: query);
  }

  Future<Response> getData(
      {required String url, Map<String, dynamic>? query , String lang = "ar", String? token}) async {
    dio.options.headers = {"lang": lang, "Authorization": token,        'Content-Type': 'application/json',};
    return await dio.get(url, queryParameters: query);
  }

}
