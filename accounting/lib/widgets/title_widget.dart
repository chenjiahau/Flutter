import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class TitleWidget extends StatelessWidget {
  final bool isDarkTheme;
  final String title;
  final double fontSize;
  final bool isBold;
  final bool isUnderline;

  const TitleWidget({
    super.key,
    required this.isDarkTheme,
    required this.title,
    this.fontSize = Styles.titleFontSize,
    this.isBold = true,
    this.isUnderline = false,
  });

  Color getColor() {
    return isDarkTheme ? Styles.darkTitleColor : Styles.lightTitleColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isUnderline
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: getColor(),
                  width: 2,
                ),
              ),
            )
          : null,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: Styles.titleFontFamily,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: getColor(),
        ),
      ),
    );
  }
}