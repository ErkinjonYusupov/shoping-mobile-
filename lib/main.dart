import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_mobile/colors.dart';
import 'package:front_mobile/languages.dart';
import 'package:front_mobile/pages/index.dart';
import 'package:front_mobile/service/ThemeService.dart';
// import 'package:front/pages/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main ()async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await Hive.initFlutter();
  await Hive.openBox("base");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      translations: Languages(),
      locale: Get.fallbackLocale,
      fallbackLocale: const Locale('uz', 'UZ'), 
      home: const Index(),
    );
  }
}



