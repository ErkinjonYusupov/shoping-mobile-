import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_mobile/colors.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

enum SingingCharacter { uz, ru, en }

class _ChangeLanguageState extends State<ChangeLanguage> {
  var base = Hive.box('base');
  SingingCharacter? _character = SingingCharacter.ru;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var lang = base.get('lang');
    if (lang == 'SingingCharacter.en') {
      _character = SingingCharacter.en;
    } else if (lang == 'SingingCharacter.ru') {
      _character = SingingCharacter.ru;
    } else {
      _character = SingingCharacter.uz;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text("_lang".tr),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          RadioListTile<SingingCharacter>(
            title: const Text("O'zbek"),
            subtitle: const Text("Uzbek"),
            value: SingingCharacter.uz,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              _character = value;
              base.put('lang', value.toString());
              Get.updateLocale(const Locale('uz', 'UZ'));
            },
          ),
          RadioListTile<SingingCharacter>(
            title: const Text("Русский"),
            subtitle: const Text("Rusian"),
            value: SingingCharacter.ru,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              _character = value;
              base.put('lang', value.toString());
              Get.updateLocale(const Locale('ru', 'RU'));
            },
          ),
          RadioListTile<SingingCharacter>(
            title: const Text("English"),
            subtitle: const Text("English"),
            value: SingingCharacter.en,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              _character = value;
              base.put('lang', value.toString());
              Get.updateLocale(const Locale('en', 'US'));
            },
          ),
        ],
      ),
    );
  }
}
