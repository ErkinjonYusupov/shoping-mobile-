import 'package:flutter/material.dart';
import 'package:front_mobile/components/universal_widgets.dart';
import 'package:front_mobile/controllers/categories_controller.dart';
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
      appBar: AppBar(
        title:const Text('Kategoriyalar'),
        backgroundColor:const Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: SafeArea(
      child: GetBuilder<CategoriesController>(
        builder: (controller) {
          return  Text('categories');
        },
      ),
    ));
  }
}
