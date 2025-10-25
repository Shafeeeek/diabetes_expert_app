class Question {
  final String question;
  final Map<String, String> choices;
  final int weight;
  final String correctAnswer;

  Question({
    required this.question,
    required this.choices,
    required this.weight,
    required this.correctAnswer,
  });
}