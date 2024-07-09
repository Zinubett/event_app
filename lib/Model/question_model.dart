class QuestionModel {
  final String question;
  String answer;
  final List<String> options;
  final bool hasAnswered;
  final bool isSelectable;
  final bool isDropDown;

  final bool isDataEnter;
  String userAnswer;
  QuestionModel({
    required this.question,
    required this.answer,
    required this.options,
    this.isSelectable = false,
    this.isDropDown = false,
    this.isDataEnter = false,
    this.hasAnswered = false,
    this.userAnswer = "",
  });

  // check if the answer is correct
  bool isCorrect(String answer) => this.answer == answer;
}

List<QuestionModel> sampleQuestions = [
  QuestionModel(
    question: "What is your event?",
    answer: "",
    isSelectable: true,
    options: [
      "Celebration (i.e., holiday party, birthday party, etc.)",
      "Gathering for an non-celebration event (i.e., team building, workshop, seminar, etc.)",
      "Activity-driven event at a vendor site (i.e., escape room, etc.)",
    ],
  ),
  QuestionModel(
    question: "How many people will be attending?",
    answer: "",
    isDropDown: true,
    options: [
      "1-5",
      "6-10",
      "11-20",
      "21-50",
      "51-100",
      "100-200",
      "200+",
    ],
  ),
  QuestionModel(
    question: "When will you have this event?",
    answer: "",
    isDataEnter: true,
    options: [],
  ),
  QuestionModel(
    question: "Do you need help planning this event?",
    answer: "",
    isSelectable: true,
    options: [
      "Yes",
      "No",
    ],
  ),
];
List<QuestionModel> addQuestions = [
  QuestionModel(
    question: "Do you need a venue?",
    answer: "",
    isSelectable: true,
    options: [
      "Yes",
      "No",
    ],
  ),
  QuestionModel(
    question: "How far from your location can this venue be?",
    answer: "",
    isSelectable: true,
    options: [
      "Less than 5 miles",
      "Less than 15 miles",
      "Less than 25 miles",
      "Less than 50 miles",
      "Any distance (willing to travel)",
    ],
  ),
  QuestionModel(
    question: "Do you want to have food at your event?",
    answer: "",
    isSelectable: true,
    options: [
      "Yes",
      "No",
    ],
  ),
  QuestionModel(
    question: "Do you want to have games at your event, like big chess board?",
    answer: "",
    isSelectable: true,
    options: [
      "Yes",
      "No",
    ],
  ),
  QuestionModel(
    question: "Do you want to have a photobooth at your event?",
    answer: "",
    isSelectable: true,
    options: [
      "Yes",
      "No",
    ],
  ),
];
