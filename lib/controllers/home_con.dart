import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_mobile/colors.dart';
import 'package:front_mobile/pages/cart.dart';
import 'package:front_mobile/pages/categories.dart';
import 'package:front_mobile/pages/home.dart';
import 'package:front_mobile/pages/index.dart';
import 'package:front_mobile/pages/profile.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class HomePageController extends GetxController{
   List menus = [
    {'id': 1, 'icon': "assets/images/home.svg"},
    {'id': 2, 'icon': "assets/images/search.svg"},
    {'id': 3, 'icon': "assets/images/cart.svg"},
    {'id': 4, 'icon': "assets/images/heart.svg"},
    {'id': 5, 'icon': "assets/images/user.svg"},
  ];
  int currentPage=1;
  Widget choosePage (int index){
    switch (index) {
      case 1:return const HomeScreen();  
      case 2:return const CategoriesScreen();
      case 3:return const CartScreen();
      case 4:return const ProfileScreen();
      case 5:return const ProfileScreen();
    }
    return Container();
  }
  void chooseCurrent(int index){
    currentPage=index;
    update();
  }
  Color chooseColor(int index){
    if(index==currentPage){
      return tabColor;
    }
    return const Color.fromARGB(255, 106, 106, 106);
  }
} 
