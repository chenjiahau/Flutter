import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:accounting/providers/theme_provider.dart';
import 'package:accounting/providers/user_provider.dart';

import 'package:accounting/utils/theme_util.dart';
import 'package:accounting/utils/validation_util.dart';

import 'package:accounting/widgets/title_widget.dart';
import 'package:accounting/widgets/input_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Map<String, dynamic> emailData = {
    "controller": TextEditingController(),
    "focusNode": FocusNode(),
    "hintText": 'Enter your email',
    "isEmail": true,
    "isRequired": true,
    "isTouched": false,
    "isVerified": false,
  };

  Map<String, dynamic> passwordData = {
    "controller": TextEditingController(),
    "focusNode": FocusNode(),
    "hintText": 'Enter your password',
    "minLength": 8,
    "maxLength": 32,
    "isPassword": true,
    "isOpenEye": false,
    "isRequired": true,
    "isTouched": false,
    "isVerified": false,
  };

  @override
  void initState() {
    super.initState();

    emailData["focusNode"].addListener(() {
      if (emailData["focusNode"].hasFocus) {
        setState(() {
          emailData["isTouched"] = true;
        });
      }
    });

    passwordData["focusNode"].addListener(() {
      if (passwordData["focusNode"].hasFocus) {
        setState(() {
          passwordData["isTouched"] = true;
        });
      }
    });
  }

  void togglePasswordEye() {
    setState(() {
      passwordData["isOpenEye"] = !passwordData["isOpenEye"];
    });
  }

  void checkEmailValidation() {
    setState(() {
      emailData["isTouched"] = true;
    });

    if (emailData["isTouched"]) {
      setState(() {
        emailData["isVerified"] = checkEmail(emailData["controller"].text);
      });
    } else {
      setState(() {
        emailData["isVerified"] = false;
      });
    }
  }

  void checkPasswordValidation() {
    setState(() {
      passwordData["isTouched"] = true;
    });

    if (passwordData["isTouched"]) {
      setState(() {
        passwordData["isVerified"] = checkString(
          passwordData["controller"].text,
          passwordData["minLength"],
          passwordData["maxLength"],
        );
      });
    } else {
      setState(() {
        passwordData["isVerified"] = false;
      });
    }
  }

  @override
  void dispose() {
    passwordData["controller"].dispose();
    passwordData["focusNode"].dispose();
    super.dispose();
  }

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
              body:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleWidget(
                        isDarkTheme: themeProvider.isDarkTheme,
                        title: 'E-mail',
                      ),
                      InputWidget(
                          isDarkTheme: themeProvider.isDarkTheme,
                          controller: emailData["controller"],
                          focusNode: emailData["focusNode"],
                          hintText: emailData["hintText"],
                          isEmail: emailData["isEmail"],
                          isRequired: emailData["isRequired"],
                          isTouched: emailData["isTouched"],
                          isVerified: emailData["isVerified"],
                          onChanged: (value) => checkEmailValidation()
                      ),
                      TitleWidget(
                        isDarkTheme: themeProvider.isDarkTheme,
                        title: 'Password',
                      ),
                      InputWidget(
                        isDarkTheme: themeProvider.isDarkTheme,
                        controller: passwordData["controller"],
                        focusNode: passwordData["focusNode"],
                        hintText: passwordData["hintText"],
                        minLength: passwordData["minLength"],
                        maxLength: passwordData["maxLength"],
                        isPassword: passwordData["isPassword"],
                        isOpenEye: passwordData["isOpenEye"],
                        isRequired: passwordData["isRequired"],
                        isTouched: passwordData["isTouched"],
                        isVerified: passwordData["isVerified"],
                        toggleEye: togglePasswordEye,
                        onChanged: (value) => checkPasswordValidation(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to login screen
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          );
        },
      ),
    );
  }
}