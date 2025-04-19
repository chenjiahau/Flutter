import 'package:flutter/material.dart';

bool checkString(String? str, int minLength, int maxLength) {
  if (str == null || str.isEmpty) {
    return false;
  }

  if (str.length < minLength || str.length > maxLength) {
    return false;
  }

  return true;
}

bool checkEmail(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }

  String pattern =r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

bool checkPhoneNumber(String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) {
    return false;
  }

  String pattern = r'^\+?[0-9]{10,15}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(phoneNumber);
}