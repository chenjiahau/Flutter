import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  static const userStatus = 'USER_STATUS';
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  // Set the user status in shared preferences
  setUser(bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(userStatus, value);
    _isLoggedIn = value;
    notifyListeners();
  }

  // Get the user status from shared preferences
  Future<bool> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _isLoggedIn = sp.getBool(userStatus) ?? false;
    notifyListeners();
    return isLoggedIn;
  }
}