import 'package:flutter/material.dart';

import 'package:front_mobile/controllers/home_con.dart';
import 'package:get/get.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  HomePageController controller=Get.put(HomePageController());  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:GetBuilder<HomePageController>(
        builder: (controller) {
          return Scaffold(
            body: controller.choosePage(controller.currentPage),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: [
                  Spacer(),
              IconButton(onPressed: (){
                controller.chooseCurrent(0);
              }, icon: Icon(Icons.home_outlined, color: controller.chooseColor(0), size: 25)),
              Spacer(),
              IconButton(onPressed: (){
                controller.chooseCurrent(1);
              }, icon: Icon(Icons.category_outlined, color: controller.chooseColor(1), size: 25)),
              Spacer(),
              IconButton(onPressed: (){
                controller.chooseCurrent(2);
              }, icon: Icon(Icons.shopping_basket_outlined, color: controller.chooseColor(2), size: 25)),
              Spacer(),
              IconButton(onPressed: (){
                controller.chooseCurrent(3);
              }, icon: Icon(Icons.person_outline_sharp, color: controller.chooseColor(3), size: 25,)),
              Spacer(),
                ],
              ),
            ),
          );
        },
      )
      );
  }
}