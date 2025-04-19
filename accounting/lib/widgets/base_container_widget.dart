import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class BaseContainerWidget extends StatelessWidget {
  final bool isDarkTheme;
  final Widget child;
  final double width;
  final double? borderRadius;
  final Color? borderColor;
  final Border? border;
  final BoxShadow? boxShadow;
  final double? padding;

  const BaseContainerWidget({
    super.key,
    required this.isDarkTheme,
    required this.child,
    required this.width,
    this.borderRadius = Styles.borderRadius,
    this.borderColor = Colors.transparent,
    this.border = const Border(
      top: BorderSide(color: Colors.transparent),
      bottom: BorderSide(color: Colors.transparent),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
    ),
    this.boxShadow = const BoxShadow(
      color: Colors.transparent,
      blurRadius: 0.0,
      offset: Offset(0, 0),
    ),
    this.padding = Styles.padding * 2,
  });

  Color getBackgroundColor() {
    return isDarkTheme
        ? Styles.darkScaffoldBackgroundColor
        : Styles.lightScaffoldBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        color: getBackgroundColor(),
        borderRadius: BorderRadius.circular(borderRadius!),
        border: border,
        boxShadow: [
          boxShadow!
        ],
      ),
      child: child,
    );
  }
}
