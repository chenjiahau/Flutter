import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:accounting/providers/theme_provider.dart';
import 'package:accounting/providers/user_provider.dart';

import 'package:accounting/utils/theme_util.dart';
import 'package:accounting/const/style.dart';

import 'package:accounting/screens/signin_screen.dart';

import 'package:accounting/models/token_model.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _tokenCheckTimer;

  @override
  void initState() {
    super.initState();
    EasyLoading.dismiss();

    // Check if the token is expired every 1 minute
    _tokenCheckTimer = Timer.periodic(Duration(seconds: 60), (_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final token = userProvider.token;

      if (!Token.validToken(token)) {
        Navigator.pushReplacementNamed(context, SignInScreen.id);
        _tokenCheckTimer?.cancel();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<UserProvider>().clearToken();
                Navigator.pushReplacementNamed(context, SignInScreen.id);
                _tokenCheckTimer?.cancel();
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
