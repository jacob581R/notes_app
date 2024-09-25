import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notesapp/controllers/themeservice.dart';
import 'package:notesapp/screens/home.dart';
import './utilities/themes.dart';

void main() async {
  // Initialize GetStorage
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  ThemeService themeService = new ThemeService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: themeService.theme, // Light theme
        home: Home());
  }
}
