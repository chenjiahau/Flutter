import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class Button extends StatelessWidget {
  final bool isDarkTheme;
  final bool isDanger;
  final IconData? icon;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Function? onPressed;

  const Button({
    super.key,
    required this.isDarkTheme,
    this.icon,
    this.isDanger = false,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
  });

  Color getBackgroundColor() {
    if (backgroundColor != null) {
      return backgroundColor!;
    }

    if (isDanger) {
      return isDarkTheme
          ? Styles.darkDangerButtonBackgroundColor
          : Styles.lightDangerButtonBackgroundColor;
    }

    return isDarkTheme ? Styles.darkButtonBackgroundColor : Styles.lightButtonBackgroundColor;
  }

  Color getForegroundColor() {
    if (textColor != null) {
      return textColor!;
    }

    if (isDanger) {
      return isDarkTheme
          ? Styles.darkDangerButtonTextColor
          : Styles.lightDangerButtonTextColor;
    }

    return isDarkTheme ? Styles.darkButtonTextColor : Styles.lightButtonTextColor;
  }

  Color getTextColor() {
    if (textColor != null) {
      return textColor!;
    }

    if (isDanger) {
      return isDarkTheme
          ? Styles.darkDangerButtonTextColor
          : Styles.lightDangerButtonTextColor;
    }

    return isDarkTheme ? Styles.darkButtonTextColor : Styles.lightButtonTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: getBackgroundColor(),
        foregroundColor: getForegroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Styles.borderRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: getTextColor(),
            ),
          if (icon != null) const SizedBox(width: 12.0),
          Text(
            text,
            style: TextStyle(
              fontSize: Styles.buttonFontSize,
              fontWeight: FontWeight.bold,
              fontFamily: Styles.buttonFontFamily,
              color: getTextColor(),
            ),
          ),
        ],
      ),
    );
  }
}
