import 'package:flutter/material.dart';
import 'package:app/models/question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.gotoLandingScreen, this.questions, this.answers,
      {super.key});

  final void Function() gotoLandingScreen;
  final List<Question> questions;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    print(questions);
    print(answers);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: const Text(
          "Result Screen",
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
