// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const THEME_STATUS = "THEMESTATUS";
  static const FONT_SIZE = "FONTSIZE";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<Object> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(THEME_STATUS) ?? false;
  }
}
