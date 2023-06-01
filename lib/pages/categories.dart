import 'package:flutter/material.dart';
import 'package:front_mobile/dio/controllers/user.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  UserController controller = Get.put(UserController());
  void initState() {
    super.initState();
    controller.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Kategoriyalar'),
        backgroundColor:const Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: SafeArea(
      child: GetBuilder<UserController>(
        builder: (controller) {
          return  SingleChildScrollView(
            child: Column(
              children: List.generate(
                controller.users.length, (index) => 
                ListTile(
                  dense: true,
                  title: Text(controller.users[index].name),
                  subtitle: Text(controller.users[index].phone),
                  onTap: () {
                    Get.snackbar(
                      "Email",
                       controller.users[index].email,
                       backgroundColor:Colors.red
                       );
                  },
                )
                )
            ),
          );
        },
      ),
    ));
  }
}
