import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utilities/themes.dart';

class ThemeService {
  final storage = GetStorage();
  String darkMood = 'dark';

  // Load theme from storage
  bool loadThemeFromStorage() => storage.read(darkMood) ?? false;

  // Save theme to storage
  void saveThemeToStorage(bool isDarkMode) =>
      storage.write(darkMood, isDarkMode);

  // Switch theme and save to storage
  void switchTheme() {
    Get.changeTheme(loadThemeFromStorage()
        ? Themes.customLightTheme
        : Themes.customDarkTheme);
    saveThemeToStorage(!loadThemeFromStorage());
  }

  // Get current theme
  ThemeData get theme =>
      loadThemeFromStorage() ? Themes.customDarkTheme : Themes.customLightTheme;
}
