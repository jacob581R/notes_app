import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utilities/themeservic.dart';

class ThemeServiceController extends GetxController {
  ThemeService _themeService = ThemeService();

  // Get current theme mode from the service
  ThemeMode get themeMode => _themeService.theme;

  // Switch the theme
  void switchTheme() {
    _themeService.switchTheme();
    update(); // Update the UI whenever the theme is switched
  }
}
