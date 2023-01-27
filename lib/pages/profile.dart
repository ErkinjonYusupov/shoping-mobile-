import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/screens/change_language.dart';
import 'package:front_mobile/service/ThemeService.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 150.0,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                    bottom: -20,
                    child: Image.asset(
                      "assets/images/forAppbar.jpg",
                      fit: BoxFit.cover,
                    )),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/images/avatar.jpg"),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Collapsing Toolbar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                            Text(
                              "+99890 366 60 88",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              const emptyBody(),
              MenuItem(
                  icon: "assets/images/cart.svg",
                  title: "My_orders".tr,
                  onTap: () {},
                  dv: 'true'),
              MenuItem(
                  icon: "assets/images/comment.svg",
                  title: "My_comments".tr,
                  onTap: () {},
                  dv: 'false'),
              const emptyBody(),
              MenuItem(
                  icon: "assets/images/percent.svg",
                  title: "My_promo_codes".tr,
                  onTap: () {},
                  dv: 'true'),
              MenuItem(
                  icon: "assets/images/chat.svg",
                  title: "My_chats".tr,
                  onTap: () {},
                  dv: 'true'),
              MenuItem(
                  icon: "assets/images/bell.svg",
                  title: "Notifications".tr,
                  onTap: () {},
                  dv: 'true'),
              MenuItem(
                  icon: "assets/images/profile.svg",
                  title: "my_profile".tr,
                  onTap: () {},
                  dv: 'true'),
              MenuItem(
                  icon: "assets/images/settings.svg",
                  title: "Settings".tr,
                  onTap: () {},
                  dv: 'false'),
              const emptyBody(),
              MenuItem(
                  icon: "assets/images/world.svg",
                  title: "_lang".tr,
                  onTap: () {Get.to(()=>const ChangeLanguage());},
                  dv: 'false'),
              const emptyBody(),
              MenuItem(
                  icon: "assets/images/maps.svg",
                  title: "City".tr,
                  onTap: () {},
                  dv: 'true'),
              MenuItem(
                  icon: "assets/images/map.svg",
                  title: "Delivery_points_on_the_map".tr,
                  onTap: () {},
                  dv: 'false'),
              const emptyBody(),
              MenuItem(
                  icon: "assets/images/info.svg",
                  title: "Information".tr,
                  onTap: () {},
                  dv: 'true'),
              MenuItem(
                  icon: "assets/images/message.svg",
                  title: "contact_us".tr,
                  onTap: () {},
                  dv: 'false'),
              Container(
                color: context.theme.accentColor,
                height: 150,
                width: double.infinity,
                child: Column(
                  children: [
                   const SizedBox(height: 20,),
                    Container(
                      width: 300,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: context.theme.buttonColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          onPressed: ThemeService().switchTheme,
                          child:  Text('Log_out_of_profile'.tr)),
                    ),const SizedBox(height: 20,),
                        Text("Version".tr+ " 1.5.2(234)")
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class emptyBody extends StatelessWidget {
  const emptyBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.accentColor,
      height: 10,
      width: double.infinity,
    );
  }
}

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  final String dv;
  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.dv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                      color: Colors.grey,
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/images/right.svg',
                  color: Colors.grey,
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            dv == "true"
                ? const Divider()
                : const SizedBox(
                    height: 5,
                  )
          ],
        ),
      ),
    );
  }
}
