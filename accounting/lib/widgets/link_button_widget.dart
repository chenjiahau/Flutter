import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class LinkButton extends StatelessWidget {
  final bool isDarkTheme;
  final bool isDanger;
  final String text;
  final Color? textColor;
  final Function? onPressed;

  const LinkButton({
    super.key,
    required this.isDarkTheme,
    this.isDanger = false,
    required this.text,
    this.textColor,
    this.onPressed,
  });

  Color getTextColor() {
    if (textColor != null) {
      return textColor!;
    }

    if (isDanger) {
      return Colors.red;
    }

    return isDarkTheme ? Styles.darkPrimaryColor : Styles.lightPrimaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Styles.padding),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: Styles.buttonFontFamily,
            fontSize: Styles.buttonFontSize,
            color: getTextColor(),
          ),
        ),
      ),
    );
  }
}
