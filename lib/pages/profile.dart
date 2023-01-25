import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
            expandedHeight: 200.0,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  "assets/images/forAppbar.jpg",
                  fit: BoxFit.cover,
                )),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                      const  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/images/avatar.jpg"),
                          ),
                        ),const SizedBox(width: 5,),
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: context.theme.buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 16),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: ThemeService().switchTheme,
                  child: const Text('Change Theme')),
            ],
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}


// ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: context.theme.buttonColor,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 16),
//                     textStyle: const TextStyle(
//                         fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   onPressed: ThemeService().switchTheme,
//                   child: const Text('Change Theme')),