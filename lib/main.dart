import 'package:flutter/material.dart';
import 'package:front_mobile/languages.dart';
import 'package:front_mobile/pages/index.dart';
// import 'package:front/pages/splash_screen.dart';
import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';


void main ()async {
//  await Hive.initFlutter();
//   await Hive.openBox("base");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SignikaNegative'),
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('uz', 'UZ'), 
      darkTheme: ThemeData.dark(), 
      themeMode: ThemeMode.light,
      home: const Index(),
    );
  }
}



