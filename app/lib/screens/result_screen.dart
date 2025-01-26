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
    Widget renderQuestions() {
      if (questions.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return Container(
        margin: const EdgeInsets.only(top: 48),
        child: Column(children: [
          for (var i = 0; i < questions.length; i++)
            Container(
              width: double.infinity,
              height: 110,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: questions[i].answer == answers[i]
                    ? Colors.green
                    : Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questions[i].question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Your Answer: ${answers[i]}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Correct Answer: ${questions[i].answer}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ]),
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 760,
                child: SingleChildScrollView(child: renderQuestions()),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: ElevatedButton(
                  onPressed: gotoLandingScreen,
                  child: const Text(
                    "Back",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
