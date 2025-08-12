import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:mindowl/enum/context_type.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/presentation/provider/session_provider.dart';
import 'package:mindowl/presentation/provider/usecase_provider.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/utils/log.dart';
import 'listening_screen_state.dart';

part 'listening_screen_notifier.g.dart';

@riverpod
class ListeningScreenNotifier extends _$ListeningScreenNotifier with MyLog {
  Timer? _mainTimer; // Unified timer for all session operations
  Timer? _debounceTimer; // For debouncing text chunk updates
  String _pendingTextChunk = ''; // Buffer for debounced text

  @override
  ListeningScreenState build() {
    ref.onDispose(() {
      _cleanupTimers();
      _stopSpeechRecognition();
    });

    return const ListeningScreenState();
  }

  void _cleanupTimers() {
    _mainTimer?.cancel();
    _mainTimer = null;
    _debounceTimer?.cancel();
    _debounceTimer = null;
  }

  Future<void> initializeSession({
    String? noteId,
    String? existingSessionId,
  }) async {
    loggy.info('Initializing listening session');
    
    if (authRepo.uid.isEmpty) {
      state = state.copyWith(isLoading: false, error: 'No authenticated user');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    if (existingSessionId != null) {
      loggy.info('Using existing session: $existingSessionId');
      state = state.copyWith(isLoading: false);
      _initializeSpeechRecognition();
      return;
    }

    // Create session - noteId is optional now, backend will create note on first chunk
    final createSessionUseCase = ref.read(createSessionUseCaseProvider);
    final result = await createSessionUseCase(
      type: SessionType.listening,
      noteId: noteId, // Optional - backend creates note when first chunk arrives
    );

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (session) {
        state = state.copyWith(currentSession: session, isLoading: false, error: null);
        _startUnifiedTimer();
        _initializeSpeechRecognition();
        _autoStartSession();
      },
    );
  }

  Future<void> _autoStartSession() async {
    if (state.currentSession == null) return;

    if (state.currentSession!.status == SessionStatus.idle) {
      final startSessionUseCase = ref.read(startSessionUseCaseProvider);
      await startSessionUseCase(sessionId: state.currentSession!.id);
    }
  }

  // Watch session changes in real-time
  Session? get currentSession {
    if (state.currentSession == null) return null;
    return ref.watch(sessionByIdProvider(state.currentSession!.id));
  }

  void _startUnifiedTimer() {
    loggy.info('Starting unified session timer');
    _cleanupTimers();
    _mainTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final session = currentSession;
      if (session?.status != SessionStatus.running) {
        _cleanupTimers();
        return;
      }

      state = state.copyWith(sessionTimer: state.sessionTimer + 1);

      // Question triggers every 15 seconds
      if (state.sessionTimer == 15 || (state.sessionTimer > 15 && state.sessionTimer % 15 == 0)) {
        _triggerQuestion();
      }

      // Transcript chunk every 15 seconds
      if (state.sessionTimer % 15 == 0 && state.sessionTimer > 0) {
        _pushTranscriptChunk();
      }

      // New exo every 30 seconds
      if (state.sessionTimer % 30 == 0 && state.sessionTimer > 0) {
        _popExoForSession();
      }
    });
  }

  Future<void> _pushTranscriptChunk() async {
    final session = currentSession;
    if (session == null || 
        session.status != SessionStatus.running || 
        state.latestTextChunk.isEmpty) return;

    final startSec = (state.sessionTimer - 15).toDouble();
    final endSec = state.sessionTimer.toDouble();

    final pushTranscriptChunkUseCase = ref.read(pushTranscriptChunkUseCaseProvider);
    final result = await pushTranscriptChunkUseCase(
      sessionId: session.id,
      startSec: startSec,
      endSec: endSec,
      text: state.latestTextChunk,
    );
    
    // Handle errors from Either result
    result.fold(
      (failure) => state = state.copyWith(error: failure.message),
      (transcript) => state = state.copyWith(error: null), // Clear errors on success
    );
  }

  Future<void> _popExoForSession() async {
    final session = currentSession;
    if (session == null || session.status != SessionStatus.running) return;

    final popExoForSessionUseCase = ref.read(popExoForSessionUseCaseProvider);
    final result = await popExoForSessionUseCase(sessionId: session.id);
    
    // Handle errors from Either result
    result.fold(
      (failure) => state = state.copyWith(error: failure.message),
      (sessionExo) => state = state.copyWith(error: null), // Clear errors on success
    );
  }

  void _triggerQuestion() {
    _cleanupTimers();
    state = state.copyWith(isQuestionReady: true);
  }

  Future<void> pauseSession() async {
    final session = currentSession; // Get real-time session
    if (session == null || session.status != SessionStatus.running) return;

    loggy.info('Pausing session: ${session.id}');
    final pauseSessionUseCase = ref.read(pauseSessionUseCaseProvider);
    final result = await pauseSessionUseCase(
      sessionId: session.id,
    );

    result.fold((failure) => state = state.copyWith(error: failure.message), (
      session,
    ) {
      _cleanupTimers();
      _stopSpeechRecognition();
    });
  }

  Future<void> resumeSession() async {
    final session = currentSession; // Get real-time session
    if (session == null || session.status != SessionStatus.paused) return;

    loggy.info('Resuming session: ${session.id}');
    final startSessionUseCase = ref.read(startSessionUseCaseProvider);
    final result = await startSessionUseCase(
      sessionId: session.id,
    );

    result.fold((failure) => state = state.copyWith(error: failure.message), (
      session,
    ) {
      _startUnifiedTimer();
      _startSpeechRecognition();
    });
  }

  Future<void> endSession() async {
    final session = currentSession; // Get real-time session
    if (session == null || session.status == SessionStatus.ended) return;

    loggy.info('Ending session: ${session.id}');
    final endSessionUseCase = ref.read(endSessionUseCaseProvider);
    final result = await endSessionUseCase(
      sessionId: session.id,
    );

    result.fold((failure) => state = state.copyWith(error: failure.message), (
      session,
    ) {
      _cleanupTimers();
      _stopSpeechRecognition();
    });
  }

  void updateDetectedContext(ContextType context) {
    state = state.copyWith(detectedContext: context);
  }

  Future<void> navigateToQuestion(BuildContext context) async {
    await context.push('/exo');

    if (currentSession?.status == SessionStatus.running) {
      state = state.copyWith(isQuestionReady: false);
      _startUnifiedTimer();
    }
  }

  void navigateToResults(BuildContext context) {
    context.pushReplacement('/session-results');
  }

  Future<void> _initializeSpeechRecognition() async {
    try {
      await speechRepo.initialize();
      final session = currentSession;
      if (session?.status == SessionStatus.running) {
        await _startSpeechRecognition();
      }
    } catch (e) {
      // Handle initialization error
    }
  }

  Future<void> _startSpeechRecognition() async {
    try {
      await speechRepo.startListening(onTextChunk: _onTextChunkReceived);
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
    // Update UI immediately for responsiveness
    final updatedChunks = [...state.textChunks, textChunk];
    state = state.copyWith(
      textChunks: updatedChunks,
      latestTextChunk: textChunk,
    );

    // Debounce the pending text for backend processing
    _pendingTextChunk += ' $textChunk';
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // Update the debounced text chunk for backend processing
      state = state.copyWith(latestTextChunk: _pendingTextChunk.trim());
      _pendingTextChunk = '';
    });
  }

  bool get isListening => currentSession?.status == SessionStatus.running;
  bool get isSessionEnded => currentSession?.status == SessionStatus.ended;
  bool get isSessionPaused => currentSession?.status == SessionStatus.paused;
}
