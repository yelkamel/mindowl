class Exo {
  final String id;
  final String noteId; // Reference to parent note
  final String? sessionId; // Reference to session where it was created
  final String question;
  final ExoType type;
  final List<String> options;
  final dynamic correctAnswer;
  final int xpReward;
  final String? explanation;
  final int difficulty; // 1-3 stars
  final DateTime createdAt;
  final DateTime? lastAttempted;
  final int correctAttempts;
  final int totalAttempts;
  final List<String> quizIds; // References to quizzes this exo appears in
  bool isAnswered;
  dynamic userAnswer;
  bool isCorrect;
  bool isFavorite;

  Exo({
    required this.id,
    required this.noteId,
    this.sessionId,
    required this.question,
    required this.type,
    this.options = const [],
    required this.correctAnswer,
    required this.xpReward,
    this.explanation,
    this.difficulty = 1,
    required this.createdAt,
    this.lastAttempted,
    this.correctAttempts = 0,
    this.totalAttempts = 0,
    this.quizIds = const [],
    this.isAnswered = false,
    this.userAnswer,
    this.isCorrect = false,
    this.isFavorite = false,
  });
  
  double get successRate => totalAttempts > 0 ? correctAttempts / totalAttempts : 0.0;
  bool get isMastered => successRate >= 0.8 && totalAttempts >= 2;
  String get difficultyStars => '⭐' * difficulty;
  
  String get statusText {
    if (!isAnswered) return 'Not Attempted';
    if (isMastered) return 'Mastered';
    if (successRate >= 0.5) return 'Good Progress';
    return 'Needs Practice';
  }
}

enum ExoType { multipleChoice, trueFalse, singleAnswer }
