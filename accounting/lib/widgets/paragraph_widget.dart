import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class ParagraphWidget extends StatelessWidget {
  final bool isDarkTheme;
  final String text;
  final double fontSize;
  final Color? textColor;

  const ParagraphWidget({
    super.key,
    required this.isDarkTheme,
    required this.text,
    this.fontSize = Styles.paragraphFontSize,
    this.textColor,
  });

  Color getTextColor() {
    if (textColor != null) {
      return textColor!;
    }

    return isDarkTheme ? Styles.darkTextColor : Styles.lightTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: Styles.paragraphFontFamily,
        fontSize: fontSize,
        color: getTextColor(),
      ),
      textAlign: TextAlign.start,
    );
  }
}
