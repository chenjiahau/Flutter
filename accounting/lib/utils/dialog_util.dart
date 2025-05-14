import 'package:flutter/material.dart';

showCommonErrorDialog({
  required BuildContext context,
  String btnText = 'OK',
  final Function? callbackFn,
}) {
  showDialog(
    context: context,
    builder: (context) {
      final width = MediaQuery.of(context).size.width;

      return AlertDialog(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Error', style: TextStyle(color: Colors.white)),
        content: SizedBox(
          width: width * 0.8,
          child: const Text(
            'An error occurred. Please try again later.',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (callbackFn != null) {
                callbackFn();
              }
            },
            child: Text(btnText),
          ),
        ],
      );
    },
  );
}

showSuccessDialog({
  required BuildContext context,
  required String message,
  String btnText = 'OK',
  final Function? callbackFn,
}) {
  showDialog(
    context: context,
    builder: (context) {
      final width = MediaQuery.of(context).size.width;

      return AlertDialog(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: SizedBox(
            width: width * 0.8,
            child: Text(
                message,
                style: const TextStyle(color: Colors.white)
            )
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (callbackFn != null) {
                callbackFn();
              }
            },
            child: Text(btnText),
          ),
        ],
      );
    },
  );
}

showErrorDialog({
  required BuildContext context,
  required String message,
  String btnText = 'OK',
  final Function? callbackFn,
}) {
  showDialog(
    context: context,
    builder: (context) {
      final width = MediaQuery.of(context).size.width;

      return AlertDialog(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: SizedBox(
          width: width * 0.8,
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (callbackFn != null) {
                callbackFn();
              }
            },
            child: Text(btnText),
          ),
        ],
      );
    },
  );
}
