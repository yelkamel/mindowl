import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mindowl/usecases/user_logged_anonymously_usecase.dart';
import 'package:mindowl/usecases/create_session_usecase.dart';
import 'package:mindowl/usecases/prepare_quiz_session_usecase.dart';
import 'package:mindowl/usecases/pop_exo_for_session_usecase.dart';
import 'package:mindowl/usecases/start_session_usecase.dart';
import 'package:mindowl/usecases/end_session_usecase.dart';
import 'package:mindowl/usecases/push_transcript_chunk_usecase.dart';
import 'package:mindowl/usecases/advance_quiz_cursor_usecase.dart';
import 'package:mindowl/usecases/answer_exo_usecase.dart';
import 'package:mindowl/usecases/watch_session_usecase.dart';
import 'package:mindowl/usecases/watch_session_exos_usecase.dart';
import 'package:mindowl/usecases/watch_note_usecase.dart';
import 'package:mindowl/usecases/watch_note_exos_usecase.dart';
import 'package:mindowl/usecases/watch_exo_attempts_usecase.dart';
import 'package:mindowl/usecases/get_new_exos_after_usecase.dart';
import 'package:mindowl/usecases/pause_session_usecase.dart';

part 'usecase_provider.g.dart';

// User Management Use Cases
@riverpod
UserLoggedAnonymouslyUseCase userLoggedAnonymouslyUseCase(Ref ref) {
  return UserLoggedAnonymouslyUseCase();
}

// Session Management Use Cases
@riverpod
CreateSessionUseCase createSessionUseCase(Ref ref) {
  return CreateSessionUseCase();
}

@riverpod
StartSessionUseCase startSessionUseCase(Ref ref) {
  return StartSessionUseCase();
}

@riverpod
PauseSessionUseCase pauseSessionUseCase(Ref ref) {
  return PauseSessionUseCase();
}

@riverpod
EndSessionUseCase endSessionUseCase(Ref ref) {
  return EndSessionUseCase();
}

// Quiz Management Use Cases
@riverpod
PrepareQuizSessionUseCase prepareQuizSessionUseCase(Ref ref) {
  return PrepareQuizSessionUseCase();
}

@riverpod
AdvanceQuizCursorUseCase advanceQuizCursorUseCase(Ref ref) {
  return AdvanceQuizCursorUseCase();
}

@riverpod
AnswerExoUseCase answerExoUseCase(Ref ref) {
  return AnswerExoUseCase();
}

// Session Content Use Cases
@riverpod
PushTranscriptChunkUseCase pushTranscriptChunkUseCase(Ref ref) {
  return PushTranscriptChunkUseCase();
}

@riverpod
PopExoForSessionUseCase popExoForSessionUseCase(Ref ref) {
  return PopExoForSessionUseCase();
}

@riverpod
GetNewExosAfterUseCase getNewExosAfterUseCase(Ref ref) {
  return GetNewExosAfterUseCase();
}

// Data Watching Use Cases
@riverpod
WatchSessionUseCase watchSessionUseCase(Ref ref) {
  return WatchSessionUseCase();
}

@riverpod
WatchSessionExosUseCase watchSessionExosUseCase(Ref ref) {
  return WatchSessionExosUseCase();
}

@riverpod
WatchNoteUseCase watchNoteUseCase(Ref ref) {
  return WatchNoteUseCase();
}

@riverpod
WatchNoteExosUseCase watchNoteExosUseCase(Ref ref) {
  return WatchNoteExosUseCase();
}

@riverpod
WatchExoAttemptsUseCase watchExoAttemptsUseCase(Ref ref) {
  return WatchExoAttemptsUseCase();
}