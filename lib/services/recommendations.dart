String giveRecommendations({
  required String diagnosis,
  String? familyHistory,
  String? activityLevel,
  String? smokingStatus,
  String? dietType,
}) {
  final buffer = StringBuffer("Diagnosis: $diagnosis\n");

  if (diagnosis == "Healthy" || diagnosis == "Low Risk") {
    buffer.writeln(
      "✅ You are not diabetic. Here's how to stay that way:\n"
      "- Maintain a healthy diet.\n"
      "- Exercise regularly.\n"
      "- Monitor your weight and blood sugar occasionally.\n"
      "- Get enough sleep and avoid stress.\n"
    );
  } else if (diagnosis == "Prediabetes") {
    buffer.writeln(
      "⚠️ You are at risk (Prediabetes). Take action:\n"
      "- Adopt a low-sugar, high-fiber diet.\n"
      "- Lose 5-10% of your body weight.\n"
      "- Get regular blood sugar tests.\n"
      "- Exercise at least 30 mins/day.\n"
    );
  } else if (diagnosis.contains("Type 2")) {
    buffer.writeln(
      "❗ You have Type 2 Diabetes. Management tips:\n"
      "- Monitor blood sugar daily.\n"
      "- Take prescribed medications or insulin.\n"
      "- Control carbs and sugars in your diet.\n"
      "- Get regular checkups and foot exams.\n"
    );
  } else if (diagnosis == "Type 1 Diabetes") {
    buffer.writeln(
      "❗ You have Type 1 Diabetes. This requires medical support:\n"
      "- Insulin therapy is necessary.\n"
      "- Continuous glucose monitoring is advised.\n"
      "- Meal planning and carb counting are important.\n"
      "- Stay in touch with your doctor regularly.\n"
    );
  }

  if (familyHistory == "Yes") {
    buffer.writeln("\n⚠️ Family history of diabetes detected. Regular screening is critical.");
  }
  if (activityLevel == "Sedentary") {
    buffer.writeln("\n⚠️ Sedentary lifestyle: Aim for 30+ mins of daily exercise.");
  }
  if (smokingStatus == "Yes") {
    buffer.writeln("\n⚠️ Smoking increases diabetes complications. Seek cessation support.");
  }
  if (dietType == "High-Sugar") {
    buffer.writeln("\n⚠️ High-sugar diet: Switch to low-sugar, high-fiber meals.");
  }

  buffer.writeln(
    "\n💡 General Prevention Tips:\n"
    "- Avoid smoking & alcohol.\n"
    "- Manage stress through meditation or hobbies.\n"
    "- Keep a regular sleep schedule.\n"
  );

  return buffer.toString();
}