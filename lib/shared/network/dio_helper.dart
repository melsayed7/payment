import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://accept.paymob.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData(
      {required String endPoint, required Map<String, dynamic> data}) {
    return dio.post(endPoint, data: data);
  }

  static Future<Response> getData(
      {required String endPoint, required Map<String, dynamic> data}) {
    return dio.get(endPoint, queryParameters: data);
  }
}
