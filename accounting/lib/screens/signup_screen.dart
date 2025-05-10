import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:accounting/providers/theme_provider.dart';
import 'package:accounting/providers/user_provider.dart';

import 'package:accounting/utils/theme_util.dart';
import 'package:accounting/utils/validation_util.dart';

import 'package:accounting/const/app-info.dart';
import 'package:accounting/const/style.dart';

import 'package:accounting/widgets/circle_image_widget.dart';
import 'package:accounting/widgets/base_container_widget.dart';
import 'package:accounting/widgets/title_widget.dart';
import 'package:accounting/widgets/input_widget.dart';
import 'package:accounting/widgets/button_widget.dart';
import 'package:accounting/widgets/link_button_widget.dart';
import 'package:accounting/widgets/paragraph_widget.dart';
import 'package:accounting/widgets/divider_widget.dart';
import 'package:accounting/widgets/error_message_widget.dart';

import 'package:accounting/screens/home_screen.dart';
import 'package:accounting/screens/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = '/signup';

  final ThemeData themeData;
  const SignUpScreen({super.key, required this.themeData});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Map<String, dynamic> email = {
    "controller": TextEditingController(),
    "focusNode": FocusNode(),
    "hintText": 'Enter your email',
    "isEmail": true,
    "isRequired": true,
    "isEnabled": true,
    "isTouched": false,
    "isVerified": false,
  };

  Map<String, dynamic> name = {
    "controller": TextEditingController(),
    "focusNode": FocusNode(),
    "hintText": 'Enter your name',
    "isRequired": true,
    "isEnabled": true,
    "isTouched": false,
    "isVerified": false,
  };

  Map<String, dynamic> password = {
    "controller": TextEditingController(),
    "focusNode": FocusNode(),
    "hintText": 'Enter your password',
    "minLength": 8,
    "maxLength": 32,
    "isPassword": true,
    "isOpenEye": false,
    "isRequired": true,
    "isEnabled": true,
    "isTouched": false,
    "isVerified": false,
  };

  Map<String, dynamic> confirmPassword = {
    "controller": TextEditingController(),
    "focusNode": FocusNode(),
    "hintText": 'Confirm your password',
    "minLength": 8,
    "maxLength": 32,
    "isPassword": true,
    "isOpenEye": false,
    "isRequired": true,
    "isEnabled": true,
    "isTouched": false,
    "isVerified": false,
  };

  @override
  void initState() {
    super.initState();

    email["focusNode"].addListener(() {
      if (email["focusNode"].hasFocus) {
        setState(() {
          email["isTouched"] = true;
        });
      }
    });

    name["focusNode"].addListener(() {
      if (name["focusNode"].hasFocus) {
        setState(() {
          name["isTouched"] = true;
        });
      }
    });

    password["focusNode"].addListener(() {
      if (password["focusNode"].hasFocus) {
        setState(() {
          password["isTouched"] = true;
        });
      }
    });

    confirmPassword["focusNode"].addListener(() {
      if (confirmPassword["focusNode"].hasFocus) {
        setState(() {
          confirmPassword["isTouched"] = true;
        });
      }
    });
  }

  void togglePasswordEye() {
    setState(() {
      password["isOpenEye"] = !password["isOpenEye"];
    });
  }

  void toggleConfirmPasswordEye() {
    setState(() {
      confirmPassword["isOpenEye"] = !confirmPassword["isOpenEye"];
    });
  }

  void checkEmailValidation() {
    setState(() {
      email["isTouched"] = true;
    });

    if (email["isTouched"]) {
      setState(() {
        email["isVerified"] = checkEmail(email["controller"].text);
      });
    } else {
      setState(() {
        email["isVerified"] = false;
      });
    }
  }

  void checkPasswordValidation() {
    setState(() {
      password["isTouched"] = true;
    });

    if (password["isTouched"]) {
      setState(() {
        password["isVerified"] = checkString(
          password["controller"].text,
          password["minLength"],
          password["maxLength"],
        );
      });
    } else {
      setState(() {
        password["isVerified"] = false;
      });
    }
  }

  void checkConfirmPasswordValidation() {
    setState(() {
      confirmPassword["isTouched"] = true;
    });

    if (confirmPassword["isTouched"]) {
      setState(() {
        confirmPassword["isVerified"] = checkString(
          confirmPassword["controller"].text,
          confirmPassword["minLength"],
          confirmPassword["maxLength"],
        );
      });
    } else {
      setState(() {
        confirmPassword["isVerified"] = false;
      });
    }
  }

  @override
  void dispose() {
    email["controller"].dispose();
    name["controller"].dispose();
    password["controller"].dispose();
    confirmPassword["controller"].dispose();
    email["focusNode"].dispose();
    name["focusNode"].dispose();
    password["focusNode"].dispose();
    confirmPassword["focusNode"].dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final themeProvider = context.watch<ThemeProvider>();
    final userProvider = context.watch<UserProvider>();

    return MaterialApp(
      theme: widget.themeData,
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Container(
                    color: widget.themeData.scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(Styles.padding),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleImageWidget(
                              imagePath: AppInfo.logoPath,
                              width: width * 0.3,
                              height: width * 0.3,
                            ),
                            DividerWidget(),
                            Align(
                              alignment: Alignment.center,
                              child: TitleWidget(
                                isDarkTheme: themeProvider.isDarkTheme,
                                title: 'Accounting App',
                              ),
                            ),
                            DividerWidget(),
                            BaseContainerWidget(
                              isDarkTheme: themeProvider.isDarkTheme,
                              width: width,
                              padding: 0.0,
                              borderColor: widget.themeData.primaryColor,
                              child: Column(
                                children: [
                                  InputWidget(
                                    isDarkTheme: themeProvider.isDarkTheme,
                                    controller: email["controller"],
                                    focusNode: email["focusNode"],
                                    hintText: email["hintText"],
                                    isEmail: email["isEmail"],
                                    isRequired: email["isRequired"],
                                    isEnabled: email["isEnabled"],
                                    isTouched: email["isTouched"],
                                    isVerified: email["isVerified"],
                                    onChanged:
                                        (value) => checkEmailValidation(),
                                  ),
                                  ErrorMessage(
                                    message: "Invalid email address",
                                  ),
                                  DividerWidget(),
                                  InputWidget(
                                    isDarkTheme: themeProvider.isDarkTheme,
                                    controller: name["controller"],
                                    focusNode: name["focusNode"],
                                    hintText: name["hintText"],
                                    isRequired: name["isRequired"],
                                    isEnabled: name["isEnabled"],
                                    isTouched: name["isTouched"],
                                    isVerified: name["isVerified"],
                                  ),
                                  ErrorMessage(message: "Invalid name"),
                                  DividerWidget(),
                                  InputWidget(
                                    isDarkTheme: themeProvider.isDarkTheme,
                                    controller: password["controller"],
                                    focusNode: password["focusNode"],
                                    hintText: password["hintText"],
                                    minLength: password["minLength"],
                                    maxLength: password["maxLength"],
                                    isPassword: password["isPassword"],
                                    isOpenEye: password["isOpenEye"],
                                    isRequired: password["isRequired"],
                                    isEnabled: password["isEnabled"],
                                    isTouched: password["isTouched"],
                                    isVerified: password["isVerified"],
                                    toggleEye: togglePasswordEye,
                                    onChanged:
                                        (value) => checkPasswordValidation(),
                                  ),
                                  ErrorMessage(message: "Invalid password"),
                                  DividerWidget(),
                                  InputWidget(
                                    isDarkTheme: themeProvider.isDarkTheme,
                                    controller: confirmPassword["controller"],
                                    focusNode: confirmPassword["focusNode"],
                                    hintText: confirmPassword["hintText"],
                                    minLength: confirmPassword["minLength"],
                                    maxLength: confirmPassword["maxLength"],
                                    isPassword: confirmPassword["isPassword"],
                                    isOpenEye: confirmPassword["isOpenEye"],
                                    isRequired: confirmPassword["isRequired"],
                                    isEnabled: confirmPassword["isEnabled"],
                                    isTouched: confirmPassword["isTouched"],
                                    isVerified: confirmPassword["isVerified"],
                                    toggleEye: toggleConfirmPasswordEye,
                                    onChanged:
                                        (value) =>
                                            checkConfirmPasswordValidation(),
                                  ),
                                  ErrorMessage(message: "Invalid password"),
                                ],
                              ),
                            ),
                            DividerWidget(height: Styles.dividerHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Button(
                                    isDarkTheme: themeProvider.isDarkTheme,
                                    text: 'Register',
                                    icon: IconlyBold.login,
                                    onPressed: () {
                                      EasyLoading.show(maskType: EasyLoadingMaskType.black);
                                      Future.delayed(
                                        const Duration(seconds: 3),
                                        () {
                                          EasyLoading.dismiss();
                                          userProvider.setUser(true);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      const HomeScreen(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Flexible(
                                  child: Button(
                                    isDarkTheme: themeProvider.isDarkTheme,
                                    isDanger: true,
                                    icon: IconlyBold.closeSquare,
                                    text: 'Cancel',
                                    onPressed: () {
                                      print("clicking");
                                    },
                                  ),
                                ),
                              ],
                            ),
                            DividerWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ParagraphWidget(
                                  isDarkTheme: themeProvider.isDarkTheme,
                                  text: 'Already have an account? ',
                                ),
                                LinkButton(
                                  isDarkTheme: themeProvider.isDarkTheme,
                                  isDanger: true,
                                  text: 'Sign In',
                                  onPressed: () {
                                    // Wrapping MaterialApp inside SignUpScreen will create a new navigation context
                                    // Named routes like Navigator.pushNamed(...) will not work inside this nested navigator unless defined again.
                                    // Instead of using named routes, it can use MaterialPageRoute to navigate to SignInScreen.
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => SignInScreen(
                                              themeData: widget.themeData,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
