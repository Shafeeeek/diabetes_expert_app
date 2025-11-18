import 'package:flutter/material.dart';
import 'package:diabetes_app/data/questions.dart';
import 'package:diabetes_app/models/question.dart';
import 'package:diabetes_app/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> allQuestions;
  int currentIndex = 0;
  int totalScore = 0;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    final questionMap = createDiabetesQuestions();
    allQuestions = questionMap.values.expand((list) => list).toList();
  }

  void _nextQuestion() {
    if (selectedAnswer == null) return;

    final current = allQuestions[currentIndex];
    if (selectedAnswer == current.correctAnswer) {
      totalScore += current.weight;
    }

    if (currentIndex < allQuestions.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswer = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: totalScore,
            familyHistory: "  نعم",
            activityLevel: "  قليل النشاط",
            dietType: " غني بالسكر",
            smokingStatus: "  لا",
          ),
        ),
      );
    }
  }

  // Removed duplicate build method to fix error.

  @override
  Widget build(BuildContext context) {
    final question = allQuestions[currentIndex];
    final choices = question.choices.entries.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(' السؤال ${currentIndex + 1} من ${allQuestions.length}'),
        backgroundColor: const Color.fromARGB(255, 166, 4, 230),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${currentIndex + 1}: ${question.question}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: choices.length,
                itemBuilder: (context, index) {
                  final choice = choices[index];
                  return RadioListTile<String>(
                    title: Text('${choice.key}. ${choice.value}'),
                    value: choice.key,
                    groupValue: selectedAnswer,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value;
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: selectedAnswer == null ? null : _nextQuestion,
              child: Text(currentIndex == allQuestions.length - 1 ? 'Finish' : 'Next ➡')
            ),
          ],
        ),
      ),
    );
  }
}