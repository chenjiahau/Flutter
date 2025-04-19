import 'package:flutter/material.dart';
import 'package:accounting/const/style.dart';

class CircleImageWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const CircleImageWidget({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Styles.logoBackgroundColor,
        width: width,
        height: height,
        padding: const EdgeInsets.all(Styles.padding),
        child: Image.asset(
          imagePath,
          width: width - Styles.padding,
          height: height - Styles.padding,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
