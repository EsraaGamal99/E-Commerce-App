import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
//https://www.getpostman.com/collections/94db931dc503afd508a5
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        //queryParameters: '',
        // headers: {
        //   'Content-Type': 'application/json',
        // },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
     Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async {

    dio.options.headers =
    {
      'lang':lang,
      'Content-Type': 'application/json',
      'Authorization':token??'',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,

  }) async {

    dio.options.headers = {
      'lang':lang,
      'Content-Type': 'application/json',
      'Authorization':token??'',
    };

    return await dio.post(
        url,
        queryParameters: query,
      data: data,
    );
  }
}
