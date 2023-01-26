import 'dart:ui';

import 'package:flutter/material.dart';

const backgroundColor = Color.fromRGBO(19, 28, 33, 1);
const textColor = Color.fromRGBO(241, 241, 242, 1);
const appBarColor = Color.fromRGBO(31, 44, 52, 1);
const menuColor = Color.fromARGB(255, 38, 55, 65);
const webAppBarColor = Color.fromRGBO(42, 47, 50, 1);
const messageColor = Color.fromRGBO(5, 96, 98, 1);
const selectColor = Color.fromARGB(86, 5, 96, 98);
const senderMessageColor = Color.fromRGBO(37, 45, 49, 1);
const tabColor = Color.fromRGBO(0, 167, 131, 1);
const searchBarColor = Color.fromRGBO(50, 55, 57, 1);
const dividerColor = Color.fromRGBO(37, 45, 50, 1);
const chatBarMessage = Color.fromRGBO(30, 36, 40, 1);
const mobileChatBoxColor = Color.fromRGBO(31, 44, 52, 1);

class Themes {
  static final light = ThemeData.light().copyWith(
    accentColor: Color.fromARGB(255, 228, 228, 228),
    backgroundColor: Colors.white,
    buttonColor: Color.fromRGBO(0, 167, 131, 1),
    bottomAppBarColor: Colors.white,
    appBarTheme: const AppBarTheme(color: Colors.white),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    accentColor: Color.fromARGB(244, 34, 49, 57),
    backgroundColor: Color.fromRGBO(19, 28, 33, 1),
    buttonColor: Colors.deepPurple,
    bottomAppBarColor: Color.fromRGBO(31, 44, 52, 1),
    appBarTheme: const AppBarTheme(color: Color.fromRGBO(19, 28, 33, 1)),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(31, 44, 52, 1),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
