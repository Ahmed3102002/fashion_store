import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemesController {
  final String key = 'isDarkTheme';
  saveThemesData(bool isDark) {
    GetStorage().write(key, isDark);
  }

  bool get getThemesData {
    return GetStorage().read<bool>(key) ?? false;
  }

  ThemeMode get getThemeMode {
    return getThemesData ? ThemeMode.dark : ThemeMode.light;
  }

  void get chanageThemeMode {
    Get.changeThemeMode(getThemesData ? ThemeMode.light : ThemeMode.dark);
    saveThemesData(!getThemesData);
    Get.back();
  }
}
