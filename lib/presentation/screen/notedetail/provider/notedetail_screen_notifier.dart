import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/presentation/provider/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import 'package:mindowl/model/session.dart';
import 'package:mindowl/utils/log.dart';
import 'notedetail_screen_state.dart';

part 'notedetail_screen_notifier.g.dart';

@riverpod
class NoteDetailScreenNotifier extends _$NoteDetailScreenNotifier with MyLog {
  @override
  NoteDetailScreenState build() {
    return const NoteDetailScreenState();
  }

  void initializeWithNote(Note note) {
    state = state.copyWith(currentNote: note);
  }

  void toggleShowAllExos() {
    state = state.copyWith(showAllExos: !state.showAllExos);
  }

  void toggleShowAllSessions() {
    state = state.copyWith(showAllSessions: !state.showAllSessions);
  }

  Future<void> startListeningSession(BuildContext context) async {
    if (state.currentNote == null) return;

    loggy.info('Starting listening session for note: ${state.currentNote!.id}');
    final createSessionUseCase = ref.read(createSessionUseCaseProvider);
    final result = await createSessionUseCase(
      type: SessionType.listening,
      noteId: state.currentNote!.id, // Pass existing noteId to link session to note
    );

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (session) {
        // Clear any previous errors
        state = state.copyWith(error: null);
        // Navigate to listening screen with session
        context.push('/listening', extra: {'sessionId': session.id});
      },
    );
  }

  Future<void> startQuizSession(
    BuildContext context, {
    int questionCount = 10,
  }) async {
    if (state.currentNote == null) return;

    loggy.info('Starting quiz session for note: ${state.currentNote!.id}');
    final prepareQuizSessionUseCase = ref.read(prepareQuizSessionUseCaseProvider);
    final result = await prepareQuizSessionUseCase(
      noteId: state.currentNote!.id,
      count: questionCount,
      title: 'Quiz: ${DateTime.now().toIso8601String()}',
    );

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (session) {
        // Clear any previous errors
        state = state.copyWith(error: null);
        // Navigate to quiz screen
        context.push('/quizflow', extra: {'sessionId': session.id});
      },
    );
  }

  void navigateToExo(BuildContext context, String exoId) {
    context.push(
      '/exo',
      extra: {'noteId': state.currentNote!.id, 'exoId': exoId},
    );
  }

  void shareNote() {
    // Implementation for sharing note
  }

  void favoriteNote() async {
    if (state.currentNote == null) return;

    // This would require an update note use case
    // For now, just updating the local state
    final updatedNote = state.currentNote!.copyWith(
      isFavorite: !state.currentNote!.isFavorite,
    );

    state = state.copyWith(currentNote: updatedNote);
  }

  void exportNote() {
    // Implementation for exporting note
  }
}
