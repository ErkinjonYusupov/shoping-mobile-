import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_mobile/controllers/categories_controller.dart';
import 'package:front_mobile/utils/function.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesController controller = Get.put(CategoriesController());
  void initState() {
    super.initState();
    controller.fetchCategories();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: GetBuilder<CategoriesController>(
          builder: (controller) {
            return Column(
            children: List.generate(controller.categories.length, 
            (index) => category(controller.categories[index])
            
            ),
          );
          },
          
              ),
            ),
        ));
  }
}


