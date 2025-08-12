import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/model/attempt.dart';

part 'quizflow_screen_state.freezed.dart';

@freezed
sealed class QuizFlowScreenState with _$QuizFlowScreenState {
  const factory QuizFlowScreenState({
    Session? currentSession,
    @Default([]) List<SessionExo> sessionExos,
    SessionExo? currentSessionExo,
    Exo? currentExo,
    @Default([]) List<Attempt> attempts,
    dynamic selectedAnswer,
    @Default(0) int currentQuestionIndex,
    @Default(0) int correctAnswers,
    @Default(false) bool isAnswered,
    @Default(false) bool isCorrect,
    @Default(false) bool isLoading,
    @Default(false) bool isQuizCompleted,
    String? error,
    @Default(0) int timeStarted,
  }) = _QuizFlowScreenState;

  const QuizFlowScreenState._();

  int get timeToAnswer => DateTime.now().millisecondsSinceEpoch - timeStarted;
  bool get hasSelectedAnswer => selectedAnswer != null;
  String get questionText => currentExo?.content.question ?? '';
  List<String> get options => currentExo?.content.options ?? [];
  String? get explanation => currentExo?.content.explanation;
  int get totalQuestions => currentSession?.totalQuestions ?? 0;
  double get progress => totalQuestions > 0 ? currentQuestionIndex / totalQuestions : 0.0;
  double get finalScore => totalQuestions > 0 ? correctAnswers / totalQuestions : 0.0;
  int get scorePercentage => (finalScore * 100).round();
  bool get canAdvance => isAnswered;
}