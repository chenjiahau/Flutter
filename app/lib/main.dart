import 'package:flutter/material.dart';

import 'package:app/screens/landing_screen.dart';
import 'package:app/screens/play_screen.dart';

void main() {
  runApp(const PuzzleApp());
}

class PuzzleApp extends StatefulWidget {
  const PuzzleApp({super.key});

  @override
  State<PuzzleApp> createState() => _PuzzleAppState();
}

class _PuzzleAppState extends State<PuzzleApp> {
  Widget? currentScreen;

  void gotoPlayScreen() {
    setState(() {
      currentScreen = PlayScreen(gotoLandingScreen);
    });
  }

  void gotoLandingScreen() {
    setState(() {
      currentScreen = LandingScreen(gotoPlayScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    currentScreen = LandingScreen(gotoPlayScreen);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle',
      home: currentScreen,
    );
  }
}
