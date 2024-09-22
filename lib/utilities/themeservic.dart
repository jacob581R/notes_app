import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final box = GetStorage();
  final key = 'isDarkMood';

  // Save the user's theme mode to local storage
  void saveThemeMode(bool isDarkMode) {
    box.write(key, isDarkMode);
  }

  // Load the user's theme mode from local storage, default to false (light mode)
  bool loadThemeMode() {
    // if null return false with double questions mark
    return box.read(key) ?? false;
  }

  // Get the current ThemeMode
  ThemeMode get theme => loadThemeMode() ? ThemeMode.dark : ThemeMode.light;
// Switch between dark and light mode
  void switchTheme() {
    Get.changeThemeMode(loadThemeMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!loadThemeMode());
  }
}
