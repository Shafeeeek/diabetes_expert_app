class DiagnosisEngine {
  String diagnose({
    required int score,
    String familyHistory = "Yes",
    String activityLevel = "Sedentary",
    String dietType = "High-Sugar",
    String smokingStatus = "No",
  }) {
    String diagnosis = "";

    if (score <= 15) {
      diagnosis = "Healthy";
    } else if (score <= 30) {
      diagnosis = "Low Risk";
    } else if (score <= 50) {
      diagnosis = "Prediabetes";
    } else if (score <= 70) {
      diagnosis = "Type 1 Diabetes";
    } else {
      diagnosis = "Type 2 Diabetes";
    }

    // Additional rules
    if (familyHistory == "Yes" && score > 50) {
      diagnosis = "Type 2 Diabetes (Family Risk)";
    }

    return diagnosis;
  }
}