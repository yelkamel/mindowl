import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:mindowl/presentation/provider/usecase_provider.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/utils/log.dart';
import 'mode_selection_state.dart';

part 'mode_selection_notifier.g.dart';

@riverpod
class ModeSelectionNotifier extends _$ModeSelectionNotifier with MyLog {
  @override
  ModeSelectionState build() {
    return const ModeSelectionState();
  }

  void selectMode(int mode) {
    loggy.info('Mode selected: ${mode == 0 ? 'Solo' : 'Group'}');
    state = state.copyWith(selectedMode: mode);
  }

  Future<void> startSoloSession(BuildContext context) async {
    if (state.isCreatingSession) return;

    loggy.info('Starting solo listening session');
    state = state.copyWith(isCreatingSession: true, error: null);

    try {
      final createSessionUseCase = ref.read(createSessionUseCaseProvider);
      final result = await createSessionUseCase(
        type: SessionType.listening,
        // No noteId - backend will create note on first transcript chunk
      );

      result.fold(
        (failure) {
          state = state.copyWith(
            isCreatingSession: false,
            error: failure.message,
          );
        },
        (session) {
          state = state.copyWith(isCreatingSession: false, error: null);
          // Navigate to listening screen with the created session
          context.push('/listening', extra: {'sessionId': session.id});
        },
      );
    } catch (e) {
      loggy.error('Failed to start solo session: $e');
      state = state.copyWith(
        isCreatingSession: false,
        error: 'Failed to create session. Please try again.',
      );
    }
  }

  Future<void> startGroupSession(BuildContext context) async {
    if (state.isCreatingSession) return;

    loggy.info('Starting group session');
    state = state.copyWith(isCreatingSession: true, error: null);

    // For now, just navigate to group setup
    // TODO: Implement group session creation when group features are ready
    Future.delayed(const Duration(milliseconds: 800), () {
      if (context.mounted) {
        state = state.copyWith(isCreatingSession: false);
        context.push('/group-setup');
      }
    });
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}