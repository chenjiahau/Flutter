import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppInfo {
  static String appName = dotenv.env['APP_NAME']!;
  static String logoPath = 'assets/images/logo.png';
  static String baseUrl = dotenv.env['API_BASE_URL']!;
}

class SuccessString {
  static String registration = 'Registration successful.';
  static String login = 'Login successful.';
}

class ErrorString {
  static String invalidEmail = 'Invalid email address.';
  static String invalidName = 'Invalid name.';
  static String invalidPassword = 'Invalid password.';
  static String invalidConfirmPassword = 'Invalid confirm password.';
  static String general = 'An error occurred. Please try again later.';
  static String fieldsRequired = 'Please fill in all fields correctly.';
}