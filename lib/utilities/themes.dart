import 'package:flutter/material.dart';

class Themes {
  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(color: Colors.black),
      listTileTheme: ListTileThemeData(
          tileColor: Color(0xff3C3D37), textColor: Color(0xffF5F5F5)));

  static ThemeData customLightTheme = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
          color: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
      listTileTheme: ListTileThemeData(
          tileColor: Color(0xffE9EFEC), textColor: Color(0xff181C14)));
}
