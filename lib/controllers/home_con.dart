import 'package:flutter/cupertino.dart';
import 'package:front_mobile/pages/cart.dart';
import 'package:front_mobile/pages/categories.dart';
import 'package:front_mobile/pages/home.dart';
import 'package:front_mobile/pages/index.dart';
import 'package:front_mobile/pages/profile.dart';
import 'package:get/state_manager.dart';

class HomePageController extends GetxController{
  int currentPage=0;
  Widget choosePage (int index){
    switch (index) {
      case 0:return HomeScreen();  
      case 1:return CategoriesScreen();
      case 2:return CartScreen();
      case 3:return ProfileScreen();
    }
    return Container();
  }
  void chooseCurrent(int index){
    currentPage=index;
    update();
  }
  Color chooseColor(int index){
    if(index==currentPage){
      return Color.fromARGB(255, 112, 180, 248);
    }
    return Color.fromARGB(255, 106, 106, 106);
  }
} 