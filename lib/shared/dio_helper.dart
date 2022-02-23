import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );

    // dio = Dio(
    //   BaseOptions(
    //       baseUrl: 'https://student.valuxapps.com/api/',
    //       receiveDataWhenStatusError: true),
    // );
  }

  static Future getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    var dioPass = dio; //to pass nullSafry

    if (dioPass != null) {
      dioPass.options.headers = {
        'lang': lang,
        'Content-Type': 'application/json',
        'Authorization': token ?? '', //if null send empty text
      };

      return await dioPass.get(
        url,
        queryParameters: query,
      );
    }
  }

  static Future postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    var dioPass = dio;
    if (dioPass != null) {
      dioPass.options.headers = {
        'lang': lang,
        'Authorization': token,
      };

      return await dioPass.post(
        url,
        queryParameters: query,
        data: data,
      );
    }
  }
}
