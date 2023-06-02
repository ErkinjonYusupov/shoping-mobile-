import 'package:dio/dio.dart';
import 'package:front_mobile/connection/my_dio.dart';
import 'package:front_mobile/dio/models/post.dart';
import 'package:get/get.dart';

class PostController extends GetxController{
  //network
  Dio dio = MyDio().dio();
  //store
  List<Post>posts=[];
  //actions
   void  fetchPosts ()async{
    try{
      var res=await dio.get('/posts');
      posts=postFromMap(res.data);
      update();
    }catch(err){
      print(err);
    }
  }
}