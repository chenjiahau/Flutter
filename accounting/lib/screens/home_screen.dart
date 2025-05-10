import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:accounting/providers/theme_provider.dart';
import 'package:accounting/providers/user_provider.dart';

import 'package:accounting/utils/theme_util.dart';

import 'package:accounting/const/app-info.dart';
import 'package:accounting/const/style.dart';

import 'package:accounting/screens/signin_screen.dart';
import 'package:accounting/screens/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    var isLoggedIn = context.watch<UserProvider>().isLoggedIn;

    if (!isLoggedIn) {
      Future.microtask(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) => SignInScreen(
              themeData: ThemeUtil.themeData(
                isDarkTheme: false,
                context: context,
              ),
            ),
          ),
        );
      });
    }

    return Material(
      color: Styles.lightScaffoldBackgroundColor,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(
                        themeData: ThemeUtil.themeData(
                          isDarkTheme: false,
                          context: context,
                        ),
                      ),
                    ),
                  );
                },
                child: const Text('Log out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
