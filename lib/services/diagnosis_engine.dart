class DiagnosisEngine {
  String diagnose({
    required int score,
    String familyHistory = "نعم",
    String activityLevel = "قليل النشاط",
    String dietType = "غني بالسكر",
    String smokingStatus = "لا",
  }) {
    String diagnosis = "";

    if (score <= 15) {
      diagnosis = "سليم";
    } else if (score <= 30) {
      diagnosis = " منخفض الخطورة";
    } else if (score <= 50) {
      diagnosis = " مقدمات السكري";
    } else if (score <= 70) {
      diagnosis = " السكري من النوع الأول";
    } else {
      diagnosis = " النوع الثاني";
    }

    // Additional rules
    if (familyHistory == "Yes" && score > 50) {
      diagnosis = "عائلي من النوع الثاني";
    }

    return diagnosis;
  }
}