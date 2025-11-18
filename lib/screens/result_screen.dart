import 'package:flutter/material.dart';
import 'package:diabetes_app/services/diagnosis_engine.dart';
import 'package:diabetes_app/services/recommendations.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final String familyHistory;
  final String activityLevel;
  final String dietType;
  final String smokingStatus;

  const ResultScreen({
    Key? key,
    required this.score,
    required this.familyHistory,
    required this.activityLevel,
    required this.dietType,
    required this.smokingStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final engine = DiagnosisEngine();
    final diagnosis = engine.diagnose(
      score: score,
      familyHistory: familyHistory,
      activityLevel: activityLevel,
      dietType: dietType,
      smokingStatus: smokingStatus,
    );

    final riskLevel = score <= 30
        ? "  منخفض الخطورة"
        : score <= 70
            ? "  مقدمات السكري"
            : score <= 100
                ? " النوع الثاني"
                : " السكري من النوع الأول";

    final recommendation = giveRecommendations(
      diagnosis: diagnosis,
      familyHistory: familyHistory,
      activityLevel: activityLevel,
      smokingStatus: smokingStatus,
      dietType: dietType,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Results'), backgroundColor: Colors.blue.shade100),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🩺 Your Diabetes Result Score: $score/144',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('📉 Risk Category: $riskLevel\n', style: const TextStyle(fontSize: 16)),
            const Divider(),
            SelectableText(recommendation),
          ],
        ),
      ),
    );
  }
}