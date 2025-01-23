import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:app/models/question.dart';
import 'package:app/widgets/question_card.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen(this.gotoLandingScreen, this.gotoResultScreen, {super.key});

  final void Function() gotoLandingScreen;
  final void Function(List<Question> questions, List<String> answers)
      gotoResultScreen;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  List<Question> questions = [];
  List<String> answers = [];
  int questionIndex = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    final jsonString =
        await rootBundle.rootBundle.loadString('assets/questions.json');
    final json = jsonDecode(jsonString);
    List<Question> updatedQuestions = [];

    for (var q in json) {
      Question question = Question.fromJson(q);
      updatedQuestions.add(question);
    }

    updatedQuestions.shuffle(Random());

    setState(() {
      questions = updatedQuestions;
    });
  }

  Widget renderQuestion() {
    if (questions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return QuestionCard(
      questions[questionIndex],
      (String answer) {
        setState(() {
          answers.add(answer);
          questionIndex++;
        });

        if (answers.length == questions.length) {
          super.widget.gotoResultScreen(questions, answers);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.cyan],
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 48),
                renderQuestion(),
                answers.length != questions.length
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        child: ElevatedButton(
                          onPressed: () {
                            super.widget.gotoLandingScreen();
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          )),
    );
  }
}
