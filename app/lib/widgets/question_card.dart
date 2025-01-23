import 'package:flutter/material.dart';
import 'package:app/models/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard(this.question, this.onAnswer, {Key? key})
      : super(key: key);

  final Question question;
  final void Function(String) onAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Text(
            question.question,
            style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ...question.options.map(
            (option) => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => onAnswer(option),
                child: Text(
                  option,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
