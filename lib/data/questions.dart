import 'package:diabetes_app/models/question.dart';

Map<String, List<Question>> createDiabetesQuestions() {
  final questions = <String, List<Question>>{
    "Pre-Diabetes": [
      Question(
        question: "What is responsible for destroying insulin-producing cells in Type 1 diabetes?",
        choices: {"A": "The liver", "B": "The immune system", "C": "The kidneys", "D": "The pancreas"},
        weight: 1,
        correctAnswer: "B",
      ),
      Question(
        question: "What does insulin regulate in the body?",
        choices: {"A": "Blood pressure", "B": "Heart rate", "C": "Blood sugar levels", "D": "Body temperature"},
        weight: 2,
        correctAnswer: "C",
      ),
      Question(
        question: "Which of the following is a common symptom of diabetes?",
        choices: {"A": "Frequent urination", "B": "Blurred vision", "C": "Joint pain", "D": "Hair loss"},
        weight: 1,
        correctAnswer: "A",
      ),
    ],
    "Type 1 Diabetes": [
      Question(
        question: "What is insulin resistance?",
        choices: {
          "A": "When the body produces too much insulin",
          "B": "When the body's cells do not respond properly to insulin",
          "C": "When the pancreas stops producing insulin",
          "D": "When insulin is destroyed by the immune system"
        },
        weight: 3,
        correctAnswer: "B",
      ),
      Question(
        question: "Which factor increases the risk of developing diabetes?",
        choices: {"A": "Obesity", "B": "Low blood pressure", "C": "High cholesterol", "D": "Vitamin D deficiency"},
        weight: 4,
        correctAnswer: "A",
      ),
      Question(
        question: "Which organ produces insulin?",
        choices: {"A": "Liver", "B": "Kidneys", "C": "Pancreas", "D": "Spleen"},
        weight: 3,
        correctAnswer: "C",
      ),
    ],
    // Add other categories similarly...
    "Type 2 Diabetes": [
      Question(
        question: "What distinguishes Type 1 from Type 2 diabetes?",
        choices: {
          "A": "Type 1 is caused by diet, while Type 2 is genetic.",
          "B": "Type 1 is an autoimmune reaction, while Type 2 is related to lifestyle.",
          "C": "Type 1 occurs in adults, while Type 2 occurs in children.",
          "D": "Type 1 requires oral medication, while Type 2 requires insulin."
        },
        weight: 5,
        correctAnswer: "B",
      ),
      Question(
        question: "Which complication can result from uncontrolled diabetes?",
        choices: {
          "A": "Heart disease and kidney failure",
          "B": "Improved vision",
          "C": "Weight loss",
          "D": "Increased energy"
        },
        weight: 6,
        correctAnswer: "A",
      ),
      Question(
        question: "How does regular exercise affect blood sugar levels?",
        choices: {
          "A": "It has no effect.",
          "B": "It increases blood sugar levels.",
          "C": "It lowers blood sugar levels.",
          "D": "It causes hypoglycemia permanently."
        },
        weight: 5,
        correctAnswer: "C",
      ),
    ],
    "Insulin Resistance": [
      Question(
        question: "What does the HbA1c test measure?",
        choices: {
          "A": "Daily blood sugar levels",
          "B": "Average blood sugar levels over 2-3 months",
          "C": "Insulin production",
          "D": "Cholesterol levels"
        },
        weight: 7,
        correctAnswer: "B",
      ),
      Question(
        question: "Which of these are types of oral medications for diabetes?",
        choices: {
          "A": "Metformin, sulfonylureas, and DPP-4 inhibitors",
          "B": "Insulin injections only",
          "C": "Vitamins and supplements",
          "D": "Antibiotics"
        },
        weight: 8,
        correctAnswer: "A",
      ),
      Question(
        question: "What is diabetic ketoacidosis (DKA)?",
        choices: {
          "A": "A mild form of diabetes",
          "B": "A life-threatening complication of diabetes",
          "C": "A dietary supplement",
          "D": "A type of insulin pump"
        },
        weight: 7,
        correctAnswer: "B",
      ),
    ],
    "Gestational Diabetes": [
      Question(
        question: "What type of diet is recommended for people with diabetes?",
        choices: {
          "A": "High-sugar, low-fiber",
          "B": "Low-sugar, high-fiber",
          "C": "High-fat, low-protein",
          "D": "Unrestricted diet"
        },
        weight: 9,
        correctAnswer: "B",
      ),
      Question(
        question: "How does stress affect blood sugar levels?",
        choices: {
          "A": "It has no effect.",
          "B": "It decreases blood sugar levels.",
          "C": "It increases blood sugar levels.",
          "D": "It stabilizes blood sugar levels."
        },
        weight: 10,
        correctAnswer: "C",
      ),
      Question(
        question: "Why is glucose monitoring important for managing diabetes?",
        choices: {
          "A": "To track daily calorie intake",
          "B": "To adjust insulin doses and manage blood sugar levels",
          "C": "To monitor cholesterol levels",
          "D": "To measure blood pressure"
        },
        weight: 9,
        correctAnswer: "B",
      ),
    ],
    "Diabetic Complications": [
      Question(
        question: "What is the benefit of using an insulin pump?",
        choices: {
          "A": "It eliminates the need for glucose monitoring.",
          "B": "It provides more precise insulin delivery.",
          "C": "It cures diabetes.",
          "D": "It reduces the need for dietary restrictions."
        },
        weight: 11,
        correctAnswer: "B",
      ),
      Question(
        question: "What does the glycemic index measure?",
        choices: {
          "A": "The speed at which a food raises blood sugar levels",
          "B": "The fat content of food",
          "C": "The protein content of food",
          "D": "The vitamin content of food"
        },
        weight: 12,
        correctAnswer: "A",
      ),
      Question(
        question: "How is poor sleep associated with diabetes?",
        choices: {
          "A": "It has no association.",
          "B": "It decreases diabetes risk.",
          "C": "It increases diabetes risk.",
          "D": "It improves insulin sensitivity."
        },
        weight: 11,
        correctAnswer: "C",
      ),
    ],
    "Diabetes Management": [
      Question(
        question: "Do genetics play a significant role in diabetes risk?",
        choices: {"A": "Yes", "B": "No"},
        weight: 13,
        correctAnswer: "A",
      ),
      Question(
        question: "Is gestational diabetes a temporary form of diabetes during pregnancy?",
        choices: {"A": "Yes", "B": "No"},
        weight: 14,
        correctAnswer: "A",
      ),
      Question(
        question: "Is hypoglycemia associated with low blood sugar levels?",
        choices: {"A": "Yes", "B": "No"},
        weight: 13,
        correctAnswer: "A",
      ),
    ],
    "Advanced Diabetes Research": [
      Question(
        question: "Is artificial pancreas technology an advancement in diabetes research?",
        choices: {"A": "Yes", "B": "No"},
        weight: 15,
        correctAnswer: "A",
      ),
      Question(
        question: "Can artificial intelligence help predict blood sugar trends?",
        choices: {"A": "Yes", "B": "No"},
        weight: 16,
        correctAnswer: "A",
      ),
      Question(
        question: "Are accessibility and affordability concerns related to advanced diabetes treatments?",
        choices: {"A": "Yes", "B": "No"},
        weight: 15,
        correctAnswer: "A",
      ),
    ],
  };

  // Sort each category by weight (ascending)
  questions.forEach((key, value) {
    value.sort((a, b) => a.weight.compareTo(b.weight));
  });

  return questions;
}