import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum themes { light, dark }

class ThemeController extends GetxController {
  var isDark = false.obs;

  Map<Enum, ThemeMode> themeModes = {
    themes.light: ThemeMode.light,
    themes.dark: ThemeMode.dark
  };

  SharedPreferences? prefs;

  static ThemeController get to => Get.find();

  changeTheme() {
    setMode(isDark.value ? themes.light : themes.dark);
    isDark.value = !isDark.value;
  }

  Future setMode(Enum themeText) async {
    ThemeMode themeMode = themeModes[themeText] as ThemeMode;
    Get.changeThemeMode(themeMode);
    prefs = await SharedPreferences.getInstance();
    await prefs?.setString('theme', themeText.toString());
  }

  loadThemeMode() async {
    prefs = await SharedPreferences.getInstance();
    Enum themeText =
        prefs!.getString('theme') != null ? themes.light : themes.dark;
    isDark.value = themeText == themes.dark ? true : false;
    setMode(themeText);
  }
}
