import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class InputWidget extends StatelessWidget {
  final bool isDarkTheme;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final int minLength;
  final int maxLength;
  final bool isText;
  final bool isEmail;
  final bool isNumber;
  final bool isPassword;
  final bool isOpenEye;
  final bool isReadOnly;
  final bool isEnabled;
  final bool isAutoFocus;
  final bool isRequired;
  final bool isTouched;
  final bool isVerified;
  final double fontSize;
  final double width;
  final Function()? toggleEye;
  final Function(String)? onChanged;

  const InputWidget({
    super.key,
    required this.isDarkTheme,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.minLength = 8,
    this.maxLength = 32,
    this.isText = true,
    this.isEmail = false,
    this.isNumber = false,
    this.isPassword = false,
    this.isOpenEye = false,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.isAutoFocus = false,
    this.isRequired = false,
    this.isTouched = false,
    this.isVerified = false,
    this.fontSize = Styles.inputFontSize,
    this.width = double.infinity,
    this.toggleEye,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    late TextInputType keyboardType;

    if (isEmail) {
      keyboardType = TextInputType.emailAddress;
    } else if (isNumber) {
      keyboardType = TextInputType.number;
    } else {
      keyboardType = TextInputType.text;
    }

    Color getHintTextColor() {
      return isDarkTheme ? Styles.darkTextColor.withValues(alpha: 0.5) : Styles.lightTextColor.withValues(alpha: 0.5);
    }

    Color getEnabledBorderColor() {
      if (isReadOnly) {
        return isDarkTheme ? Styles.darkTextColor.withValues(alpha: 0.5) : Styles.lightTextColor.withValues(alpha: 0.5);
      }

      if (isTouched) {
        if (isVerified) {
          return isDarkTheme ? Styles.darkPrimaryColor.withValues(alpha: 0.3) : Styles.lightPrimaryColor.withValues(alpha: 0.3);
        } else {
          return isDarkTheme ? Styles.darkErrorColor : Styles.lightErrorColor;
        }
      } else {
        return isDarkTheme ? Styles.darkPrimaryColor.withValues(alpha: 0.3) : Styles.lightPrimaryColor.withValues(alpha: 0.3);
      }
    }

    Color getFocusedBorderColor() {
      if (isReadOnly) {
        return isDarkTheme ? Styles.darkTextColor.withValues(alpha: 0.5) : Styles.lightTextColor.withValues(alpha: 0.5);
      }

      if (isVerified) {
        return isDarkTheme ? Styles.darkPrimaryColor : Styles.lightPrimaryColor;
      } else {
        return isDarkTheme ? Styles.darkErrorColor : Styles.lightErrorColor;
      }
    }

    Color getEyeIconColor() {
      if (focusNode.hasFocus) {
        return getFocusedBorderColor();
      } {
        return getEnabledBorderColor();
      }
    }

    return TextField(
      controller: controller,
      focusNode: focusNode,
      readOnly: isReadOnly,
      enabled: isEnabled,
      autofocus: isAutoFocus,
      obscureText: isPassword && !isOpenEye,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: fontSize,
        color: isDarkTheme ? Styles.darkTextColor : Styles.lightTextColor,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: Styles.padding + 8,
        ),
        filled: true,
        fillColor: isDarkTheme ? Styles.darkScaffoldBackgroundColor : Styles.lightScaffoldBackgroundColor,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: getHintTextColor(),
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  if (toggleEye != null) {
                    toggleEye!();
                  }
                },
                child: Icon(
                  !isOpenEye ? Icons.visibility : Icons.visibility_off,
                  color: getEyeIconColor(),
                ),
            )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Styles.borderRadius),
          borderSide: BorderSide(
            color: getEnabledBorderColor(),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Styles.borderRadius),
          borderSide: BorderSide(
            color: getFocusedBorderColor(),
            width: 2.0,
          ),
        ),
      ),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
    );
  }
}
