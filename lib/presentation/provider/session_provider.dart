import 'package:mindowl/repository/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/model/attempt.dart';

part 'session_provider.g.dart';

// Session providers work with backend triggers:
// - Sessions are created client-side but backend normalizes them (onSessionCreate)
// - Chunks trigger note creation/update and exo generation (onChunkCreate)
// - Attempts trigger next exo generation (onAttemptCreate)
// - All content is automatically mirrored between sessions/{}/exos/ and notes/{}/exos/

@riverpod
Session? sessionById(Ref ref, String sessionId) {
  final sessionAsync = ref.watch(sessionStreamProvider(sessionId));
  return sessionAsync.value;
}

@riverpod
Stream<Session?> sessionStream(Ref ref, String sessionId) {
  return sessionRepo.watchSession(authRepo.uid, sessionId);
}

@riverpod
List<SessionExo> sessionExosById(Ref ref, String sessionId) {
  final exosAsync = ref.watch(sessionExosStreamProvider(sessionId));
  return exosAsync.value ?? [];
}

@riverpod
Stream<List<SessionExo>> sessionExosStream(Ref ref, String sessionId) {
  return sessionExoRepo.watchSessionExos(authRepo.uid, sessionId);
}

