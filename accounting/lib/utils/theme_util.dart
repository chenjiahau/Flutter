import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class ThemeUtil {
  static ThemeData themeData({required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: isDarkTheme
          ? Styles.darkScaffoldBackgroundColor
          : Styles.lightScaffoldBackgroundColor,
      primaryColor: isDarkTheme
          ? Styles.darkPrimaryColor
          : Styles.lightPrimaryColor,
      secondaryHeaderColor: isDarkTheme
          ? Styles.darkSecondaryColor
          : Styles.lightSecondaryColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: isDarkTheme
              ? Styles.darkTextColor
              : Styles.lightTextColor,
          fontSize: 20,
        ),
        bodyMedium: TextStyle(
          color: isDarkTheme
              ? Styles.darkTextColor
              : Styles.lightTextColor,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: isDarkTheme
              ? Styles.darkTextColor
              : Styles.lightTextColor,
          fontSize: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkTheme
              ? Styles.darkButtonBackgroundColor
              : Styles.lightButtonBackgroundColor,
          foregroundColor: isDarkTheme
              ? Styles.darkButtonTextColor
              : Styles.lightButtonTextColor,
          textStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: isDarkTheme
              ? Styles.darkScaffoldBackgroundColor
              : Styles.lightScaffoldBackgroundColor,
          foregroundColor: isDarkTheme
              ? Styles.darkButtonTextColor
              : Colors.black,
          textStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}