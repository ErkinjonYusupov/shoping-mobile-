import 'package:dio/dio.dart';
import 'package:front_mobile/connection/my_interceptor.dart';


class MyDio {
  final Dio _dio = Dio();
  MyDio() {
    _dio.interceptors.add(
        MyInterceptor()
    );
  }
   Dio dio() {
    return _dio;
  }
}
