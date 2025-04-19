import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:accounting/utils/theme_util.dart';
import 'package:accounting/providers/theme_provider.dart';

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
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          var themeData = ThemeUtil.themeData(
            isDarkTheme: context.watch<ThemeProvider>().isDarkTheme,
            context: context,
          );

          return MaterialApp(
            title: 'Accounting',
            theme: themeData,
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Accounting'),
                actions: [
                  IconButton(
                    icon: Icon(themeProvider.isDarkTheme
                        ? Icons.light_mode
                        : Icons.dark_mode),
                    onPressed: () {
                      themeProvider.setDarkTheme(!themeProvider.isDarkTheme);
                    },
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Accounting App',
                      style: themeData.textTheme.titleLarge?.copyWith(),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform some action
                      print('Button Pressed');
                    },
                    child: const Text('Button'),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextButton(
                      onPressed: () {

                      },
                      child: const Text(
                        'Text Button'
                      ),
                  ),
                ],
              )
            )
          );
        },
      ),
    );
  }
}