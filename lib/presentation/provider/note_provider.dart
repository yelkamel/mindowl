import 'package:mindowl/repository/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/model/attempt.dart';

part 'note_provider.g.dart';

@riverpod
Future<List<Note>> getAllUserNotes(Ref ref) async {
  return await noteRepo.getAllNotes(authRepo.uid);
}

@riverpod
Note? noteById(Ref ref, String id) {
  final noteAsync = ref.watch(noteStreamProvider(id));
  return noteAsync.value;
}

@riverpod
Stream<Note?> noteStream(Ref ref, String id) {
  return noteRepo.watchNote(authRepo.uid, id);
}

@riverpod
List<Exo> noteExosById(Ref ref, String noteId, {int? limit}) {
  final exosAsync = ref.watch(noteExosStreamProvider(noteId, limit: limit));
  return exosAsync.value ?? [];
}

@riverpod
Stream<List<Exo>> noteExosStream(Ref ref, String noteId, {int? limit}) {
  return noteRepo.watchNoteExos(authRepo.uid, noteId, limit: limit);
}

@riverpod
List<Attempt> exoAttemptsById(Ref ref, String noteId, String exoId) {
  final attemptsAsync = ref.watch(exoAttemptsStreamProvider(noteId, exoId));
  return attemptsAsync.value ?? [];
}

@riverpod
Stream<List<Attempt>> exoAttemptsStream(Ref ref, String noteId, String exoId) {
  return attemptRepo.watchExoAttempts(authRepo.uid, noteId, exoId);
}
