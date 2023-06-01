import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_mobile/pages/test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyInterceptor extends Interceptor  {
  MyInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler){
    if (err.response?.statusCode == 401) {
        Get.offAll(()=>const TestPage());
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Content-Type'] = 'application/json';
    options.baseUrl = dotenv.env['BASE_API_URL'].toString();
    super.onRequest(options, handler);
  }
}



