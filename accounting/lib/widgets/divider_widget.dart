import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class DividerWidget extends StatelessWidget {
  final double? widget;
  final double? height;
  final Color? color;

  const DividerWidget({
    super.key,
    this.height = Styles.dividerHeight,
    this.widget = double.infinity,
    this.color = Styles.dividerColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: widget,
      child: Divider(
        height: height,
        thickness: Styles.borderWidth,
        color: color,
      ),
    );
  }
}
