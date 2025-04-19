import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const themeStatus = 'THEME_STATUS';
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  // Fetch the theme status from shared preferences
  ThemeProvider() {
    getTheme();
  }

  // Set the theme status in shared preferences
  setDarkTheme(bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(themeStatus, value);
    _isDarkTheme = value;
    notifyListeners();
  }

  // Get the theme status from shared preferences
  Future<bool> getTheme() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _isDarkTheme = sp.getBool(themeStatus) ?? false;
    notifyListeners();
    return isDarkTheme;
  }
}