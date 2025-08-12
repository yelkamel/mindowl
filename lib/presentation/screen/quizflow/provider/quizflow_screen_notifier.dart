import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:mindowl/presentation/provider/note_provider.dart';
import 'package:mindowl/presentation/provider/session_provider.dart';
import 'package:mindowl/presentation/provider/usecase_provider.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/utils/log.dart';
import 'quizflow_screen_state.dart';

part 'quizflow_screen_notifier.g.dart';

@riverpod
class QuizFlowScreenNotifier extends _$QuizFlowScreenNotifier with MyLog {

  @override
  QuizFlowScreenState build() {
    return const QuizFlowScreenState();
  }

  Future<void> initializeQuiz({
    required String noteId,
    required int questionCount,
    String? title,
    String? existingSessionId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      if (existingSessionId != null) {
        // Load existing session and first question
        state = state.copyWith(isLoading: false);
        _loadFirstQuestion();
        return;
      }

      // Create new quiz session
      final prepareQuizSessionUseCase = ref.read(prepareQuizSessionUseCaseProvider);
      final result = await prepareQuizSessionUseCase(
        noteId: noteId,
        count: questionCount,
        title: title ?? 'Quiz Session',
      );

      result.fold(
        (failure) {
          state = state.copyWith(isLoading: false, error: failure.message);
        },
        (session) {
          state = state.copyWith(currentSession: session, isLoading: false);
          _loadFirstQuestion();
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // Get session from provider
  Session? get currentSession {
    if (state.currentSession == null) return null;
    return ref.watch(sessionByIdProvider(state.currentSession!.id));
  }

  // Get session exos from provider
  List<SessionExo> get currentSessionExos {
    if (state.currentSession == null) return [];
    return ref.watch(sessionExosByIdProvider(state.currentSession!.id));
  }

  void _loadFirstQuestion() {
    final pendingExos = currentSessionExos
        .where((exo) => exo.status == SessionExoStatus.pending)
        .toList();

    if (pendingExos.isNotEmpty) {
      _loadQuestion(pendingExos.first);
    }
  }

  void _loadQuestion(SessionExo sessionExo) {
    // In a real implementation, you'd get the actual exo
    // For now, using the snapshot from sessionExo if available
    final exo = Exo(
      id: sessionExo.exoId,
      noteId: sessionExo.noteId,
      type: ExoType.mcq,
      content:
          sessionExo.snapshotLite ??
          ExoContent(
            question: "Sample quiz question",
            options: ["Option A", "Option B", "Option C", "Option D"],
            answer: "Option A",
            explanation: "This is the explanation",
          ),
      createdAt: sessionExo.spawnedAt,
    );

    state = state.copyWith(
      currentSessionExo: sessionExo,
      currentExo: exo,
      timeStarted: DateTime.now().millisecondsSinceEpoch,
      selectedAnswer: null,
      isAnswered: false,
      isCorrect: false,
      isLoading: false,
    );
  }

  void selectAnswer(dynamic answer) {
    if (state.isAnswered) return;

    state = state.copyWith(selectedAnswer: answer);
  }

  Future<void> submitAnswer() async {
    if (state.currentSessionExo == null ||
        state.currentExo == null ||
        state.selectedAnswer == null ||
        state.isAnswered) {
      return;
    }

    loggy.info('Submitting quiz answer');
    state = state.copyWith(isLoading: true);

    final isCorrect = _checkAnswer(
      state.selectedAnswer,
      state.currentExo!.content.answer,
    );
    final timeToAnswer = state.timeToAnswer;

    final answerExoUseCase = ref.read(answerExoUseCaseProvider);
    final result = await answerExoUseCase(
      sessionId: state.currentSessionExo!.sessionId,
      sessionExoId: state.currentSessionExo!.id,
      noteId: state.currentSessionExo!.noteId,
      exoId: state.currentSessionExo!.exoId,
      userAnswer: state.selectedAnswer,
      isCorrect: isCorrect,
      timeToAnswerMs: timeToAnswer,
    );

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (attempt) {
        final newCorrectAnswers = isCorrect
            ? state.correctAnswers + 1
            : state.correctAnswers;

        state = state.copyWith(
          isLoading: false,
          isAnswered: true,
          isCorrect: isCorrect,
          correctAnswers: newCorrectAnswers,
        );
      },
    );
  }

  bool _checkAnswer(dynamic userAnswer, dynamic correctAnswer) {
    if (userAnswer == null || correctAnswer == null) return false;
    return userAnswer.toString().toLowerCase() ==
        correctAnswer.toString().toLowerCase();
  }

  Future<void> nextQuestion() async {
    if (state.currentSession == null) return;

    final advanceQuizCursorUseCase = ref.read(advanceQuizCursorUseCaseProvider);
    final result = await advanceQuizCursorUseCase(
      sessionId: state.currentSession!.id,
    );

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (nextSessionExo) {
        if (nextSessionExo != null) {
          final newIndex = state.currentQuestionIndex + 1;
          state = state.copyWith(currentQuestionIndex: newIndex);
          _loadQuestion(nextSessionExo);
        } else {
          // Quiz completed
          _completeQuiz();
        }
      },
    );
  }

  Future<void> _completeQuiz() async {
    if (state.currentSession == null) return;

    final endSessionUseCase = ref.read(endSessionUseCaseProvider);
    await endSessionUseCase(sessionId: state.currentSession!.id);

    state = state.copyWith(isQuizCompleted: true);
  }

  void restartQuiz() {
    state = state.copyWith(
      currentQuestionIndex: 0,
      correctAnswers: 0,
      isQuizCompleted: false,
      selectedAnswer: null,
      isAnswered: false,
      isCorrect: false,
    );

    _loadFirstQuestion();
  }

  void exitQuiz(BuildContext context) {
    context.pop();
  }
}
