
class Quiz {
  final String id;
  final String noteId; // Reference to parent note
  final String title;
  final List<String> exoIds; // References to exos in this quiz
  final DateTime createdAt;
  final DateTime? completedAt;
  final QuizType type;
  final int totalQuestions;
  final int? currentQuestionIndex;
  final double? finalScore;
  final int? correctAnswers;
  final QuizStatus status;
  final Map<String, QuizResult> results; // exoId -> result

  Quiz({
    required this.id,
    required this.noteId,
    required this.title,
    required this.exoIds,
    required this.createdAt,
    this.completedAt,
    required this.type,
    required this.totalQuestions,
    this.currentQuestionIndex,
    this.finalScore,
    this.correctAnswers,
    this.status = QuizStatus.notStarted,
    this.results = const {},
  });

  bool get isCompleted => status == QuizStatus.completed;
  bool get isInProgress => status == QuizStatus.inProgress;
  double get progress => totalQuestions > 0 ? (currentQuestionIndex ?? 0) / totalQuestions : 0.0;
  
  String get formattedScore {
    if (finalScore == null) return 'Not completed';
    return '${(finalScore! * 100).round()}%';
  }

  String get formattedDuration {
    if (completedAt == null) return '';
    final duration = completedAt!.difference(createdAt);
    final minutes = duration.inMinutes;
    return '${minutes}min';
  }
}

class QuizResult {
  final String exoId;
  final dynamic userAnswer;
  final bool isCorrect;
  final DateTime answeredAt;
  final int timeSpent; // seconds

  QuizResult({
    required this.exoId,
    required this.userAnswer,
    required this.isCorrect,
    required this.answeredAt,
    required this.timeSpent,
  });
}

enum QuizType {
  allExos,        // All exos from the note
  incomplete,     // Only incomplete/failed exos
  favorites,      // Only favorited exos
  mixed,          // Mixed with other notes
  timed,          // Time-limited quiz
  practice        // Casual practice mode
}

enum QuizStatus {
  notStarted,
  inProgress,
  paused,
  completed,
  abandoned
}