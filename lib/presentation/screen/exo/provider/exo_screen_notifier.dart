import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:mindowl/presentation/provider/note_provider.dart';
import 'package:mindowl/presentation/provider/session_provider.dart';
import 'package:mindowl/presentation/provider/usecase_provider.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/utils/log.dart';
import 'exo_screen_state.dart';

part 'exo_screen_notifier.g.dart';

@riverpod
class ExoScreenNotifier extends _$ExoScreenNotifier with MyLog {

  @override
  ExoScreenState build() {
    return const ExoScreenState();
  }

  void initializeExo({
    required String sessionId,
    required String sessionExoId,
    required String noteId,
    required String exoId,
  }) {
    state = state.copyWith(
      currentSessionExo: SessionExo(
        id: sessionExoId,
        sessionId: sessionId,
        noteId: noteId,
        exoId: exoId,
        spawnedAt: DateTime.now(),
      ),
      timeStarted: DateTime.now().millisecondsSinceEpoch,
      isLoading: false,
    );
  }

  // Get current exo data from provider
  Exo? get currentExo {
    if (state.currentSessionExo == null) return null;
    // In a real app, you'd get the actual exo from noteExosById
    // For now, creating a sample exo
    return Exo(
      id: state.currentSessionExo!.exoId,
      noteId: state.currentSessionExo!.noteId,
      type: ExoType.mcq,
      content: ExoContent(
        question: "Sample question",
        options: ["Option A", "Option B", "Option C", "Option D"],
        answer: "Option A",
        explanation: "This is the explanation",
      ),
      createdAt: DateTime.now(),
    );
  }

  void selectAnswer(dynamic answer) {
    if (state.isAnswered) return;

    state = state.copyWith(selectedAnswer: answer);
  }

  Future<void> submitAnswer() async {
    if (state.currentSessionExo == null ||
        state.selectedAnswer == null ||
        state.isAnswered) {
      return;
    }

    final exo = currentExo;
    if (exo == null) return;

    loggy.info('Submitting exo answer');
    state = state.copyWith(isLoading: true);

    final isCorrect = _checkAnswer(state.selectedAnswer, exo.content.answer);
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
        state = state.copyWith(
          isLoading: false,
          isAnswered: true,
          isCorrect: isCorrect,
        );
      },
    );
  }

  bool _checkAnswer(dynamic userAnswer, dynamic correctAnswer) {
    if (userAnswer == null || correctAnswer == null) return false;
    return userAnswer.toString().toLowerCase() ==
        correctAnswer.toString().toLowerCase();
  }

  void nextQuestion(BuildContext context) {
    context.pop();
  }

  void showExplanation() {
    // Implementation for showing explanation
  }

  void retryQuestion() {
    state = state.copyWith(
      selectedAnswer: null,
      isAnswered: false,
      isCorrect: false,
      timeStarted: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
