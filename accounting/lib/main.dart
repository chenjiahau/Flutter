import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:accounting/providers/theme_provider.dart';
import 'package:accounting/providers/user_provider.dart';

import 'package:accounting/utils/theme_util.dart';

import 'package:accounting/screens/home_screen.dart';
import 'package:accounting/screens/signin_screen.dart';
import 'package:accounting/screens/signup_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.blue
    ..textColor = Colors.blue
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.light;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDarkTheme;
    final themeData = ThemeUtil.themeData(isDarkTheme: isDark, context: context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      builder: EasyLoading.init(),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        SignInScreen.id: (context) => SignInScreen(themeData: themeData),
        SignUpScreen.id: (context) => SignUpScreen(themeData: themeData),
      },
    );
  }
}
