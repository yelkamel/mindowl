import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindowl/enum/context_type.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/model/session_exo.dart';

part 'listening_screen_state.freezed.dart';

@freezed
sealed class ListeningScreenState with _$ListeningScreenState {
  const factory ListeningScreenState({
    @Default(true) bool isListening,
    @Default(ContextType.podcast) ContextType detectedContext,
    @Default(0) int sessionTimer,
    @Default(15) int nextQuestionCountdown,
    @Default(false) bool isQuestionReady,
    @Default(false) bool isSessionEnded,
    @Default([]) List<String> textChunks,
    @Default('') String latestTextChunk,
    Session? currentSession,
    @Default([]) List<SessionExo> sessionExos,
    @Default(false) bool isLoading,
    String? error,
  }) = _ListeningScreenState;

  const ListeningScreenState._();

  String get formattedTime {
    final minutes = (sessionTimer ~/ 60).toString().padLeft(2, '0');
    final seconds = (sessionTimer % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get nextQuestionDisplay {
    if (sessionTimer < 15) {
      return '${15 - sessionTimer}s';
    }
    return 'Ready!';
  }

  bool get shouldShowQuestionWarning => sessionTimer >= 10 && sessionTimer < 15;
}
