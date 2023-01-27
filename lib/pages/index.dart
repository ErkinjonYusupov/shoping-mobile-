import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:front_mobile/controllers/home_con.dart';
import 'package:get/get.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  HomePageController controller = Get.put(HomePageController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.currentLocale();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<HomePageController>(
      builder: (controller) {
        return GetBuilder<HomePageController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              body: controller.choosePage(controller.currentPage),
              bottomNavigationBar: BottomAppBar(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(controller.menus.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller
                                .chooseCurrent(controller.menus[index]['id']);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                controller.menus[index]['icon'],
                                color: controller
                                    .chooseColor(controller.menus[index]['id']),
                                width: 30,
                                height: 30,
                              ),
                              Text(
                                  controller.menus[index]['id'] == 1
                                      ? 'Home'.tr
                                      : controller.menus[index]['id'] == 2
                                          ? 'search'.tr
                                          : controller.menus[index]['id'] == 3
                                              ? 'cart'.tr
                                              : controller.menus[index]['id'] ==
                                                      4
                                                  ? 'Desire'.tr
                                                  : 'cobinet'.tr,
                                  style: TextStyle(
                                      color: controller.chooseColor(
                                          controller.menus[index]['id']),
                                      fontSize: 12))
                            ],
                          ),
                        );
                      })),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
