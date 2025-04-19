import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:accounting/const/style.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Styles.halfPadding,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            IconlyBold.danger,
            color: Styles.lightErrorColor,
            size: Styles.buttonIconSize,
          ),
          const SizedBox(width: Styles.margin / 2 ),
          Text(
            message,
            style: TextStyle(
              color: Colors.red,
              fontSize: Styles.paragraphFontSize,
              fontWeight: FontWeight.bold,
              fontFamily: Styles.paragraphFontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
