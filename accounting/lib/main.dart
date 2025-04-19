import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:accounting/utils/theme_util.dart';
import 'package:accounting/providers/theme_provider.dart';
import 'package:accounting/providers/user_provider.dart';

import 'package:accounting/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          var themeData = ThemeUtil.themeData(
            isDarkTheme: context.watch<ThemeProvider>().isDarkTheme,
            context: context,
          );

          return MaterialApp(
            theme: themeData,
            home: Scaffold(
              body: const RootScreen(),
            )
          );
        },
      ),
    );
  }
}