import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:accounting/models/token_model.dart';

class UserProvider with ChangeNotifier {
  static const userToken = 'USER_TOKEN';
  Token _token = Token();
  Token get token => _token;

  UserProvider() {
    loadToken();
  }

  // Set the user status in shared preferences
  setToken(Token token) async {
    _token = token;
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(userToken, jsonEncode(token.toJson()));
    notifyListeners();
  }

  // Get the user status from shared preferences
  Future<void> loadToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(userToken);

    if (token != null) {
      _token = Token.fromJson(jsonDecode(token));
    } else {
      _token = Token();
    }

    notifyListeners();
  }

  // Clear the user status from shared preferences
  Future<void> clearToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(userToken);
    _token = Token();
    notifyListeners();
  }
}