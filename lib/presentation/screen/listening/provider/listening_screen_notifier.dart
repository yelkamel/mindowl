import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:mindowl/enum/context_type.dart';
import 'package:mindowl/repository/injection.dart';
import 'listening_screen_state.dart';

part 'listening_screen_notifier.g.dart';

@riverpod
class ListeningScreenNotifier extends _$ListeningScreenNotifier {
  Timer? _sessionTimer;

  @override
  ListeningScreenState build() {
    ref.onDispose(() {
      _sessionTimer?.cancel();
      _stopSpeechRecognition();
    });

    _startSessionTimer();
    _initializeSpeechRecognition();

    return const ListeningScreenState();
  }

  void _startSessionTimer() {
    _sessionTimer?.cancel();
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!state.isListening) return;

      state = state.copyWith(sessionTimer: state.sessionTimer + 1);

      if (state.sessionTimer == 15) {
        _triggerQuestion();
      } else if (state.sessionTimer > 15 && state.sessionTimer % 15 == 0) {
        _triggerQuestion();
      }
    });
  }

  void _triggerQuestion() {
    _sessionTimer?.cancel();
    state = state.copyWith(isQuestionReady: true);
  }

  void pauseSession() {
    _sessionTimer?.cancel();
    _stopSpeechRecognition();
    state = state.copyWith(isListening: false);
  }

  void resumeSession() {
    state = state.copyWith(isListening: true);
    _startSessionTimer();
    _startSpeechRecognition();
  }

  void endSession() {
    _sessionTimer?.cancel();
    _stopSpeechRecognition();
    state = state.copyWith(isListening: false, isSessionEnded: true);
  }

  void updateDetectedContext(ContextType context) {
    state = state.copyWith(detectedContext: context);
  }

  Future<void> navigateToQuestion(BuildContext context) async {
    await context.push('/exo');

    if (state.isListening && !state.isSessionEnded) {
      state = state.copyWith(isQuestionReady: false);
      _startSessionTimer();
    }
  }

  void navigateToResults(BuildContext context) {
    context.pushReplacement('/session-results');
  }

  Future<void> _initializeSpeechRecognition() async {
    try {
      await speechRepo.initialize();
      if (state.isListening) {
        await _startSpeechRecognition();
      }
    } catch (e) {
      // Handle initialization error
    }
  }

  Future<void> _startSpeechRecognition() async {
    try {
      await speechRepo.startListening(
        onTextChunk: _onTextChunkReceived,
      );
    } catch (e) {
      // Handle speech recognition error
    }
  }

  Future<void> _stopSpeechRecognition() async {
    try {
      await speechRepo.stopListening();
    } catch (e) {
      // Handle stop error
    }
  }

  void _onTextChunkReceived(String textChunk) {
    final updatedChunks = [...state.textChunks, textChunk];
    state = state.copyWith(
      textChunks: updatedChunks,
      latestTextChunk: textChunk,
    );
  }
}
