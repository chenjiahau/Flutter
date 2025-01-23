class Question {
  final int id;
  final String question;
  final List<String> options;
  final String answer;

  Question(
      {required this.id,
      required this.question,
      required this.options,
      required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      options: json['options'].cast<String>(),
      answer: json['answer'],
    );
  }
}
