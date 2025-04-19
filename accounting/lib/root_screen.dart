import 'package:flutter/material.dart';

import 'package:accounting/providers/user_provider.dart';
import 'package:accounting/screens/unauthentic_screen.dart';
import 'package:accounting/screens/main_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = UserProvider();

    return FutureBuilder<bool>(
      future: userProvider.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading user status'));
        } else {
          final isLoggedIn = snapshot.data ?? false;
          return !isLoggedIn ? const MainScreen() : const UnauthenticScreen();
        }
      },
    );
  }
}
