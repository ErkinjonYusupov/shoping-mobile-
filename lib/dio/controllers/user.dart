import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_mobile/connection/my_dio.dart';
import 'package:front_mobile/dio/models/user.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class UserController extends GetxController {
  List<User> users = [];
  Dio dio = MyDio().dio();

//actions
  void fetchUsers() async {
    try {
      var data = await dio.get('/users');
      users = userFromMap(data.data);
      update();
    } catch (error) {
      print(error);
    }
  }
  void addUser() async {
    try {
      var data = await dio.post('/users1');
      users = userFromMap(data.data);
      update();
    } catch (error) {
      print(error);
    }
  }
}
