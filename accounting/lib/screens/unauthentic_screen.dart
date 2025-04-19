import 'package:flutter/material.dart';

class UnauthenticScreen extends StatelessWidget {
  const UnauthenticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Sign in/up',
        ),
      ),
    );
  }
}