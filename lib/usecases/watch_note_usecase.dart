import 'package:mindowl/model/note.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/utils/log.dart';

class WatchNoteUseCase with MyLog {
  WatchNoteUseCase();

  Stream<Note?> call({
    required String uid,
    required String noteId,
  }) {
    try {
      loggy.info('Watching note: $noteId');
      return noteRepo.watchNote(uid, noteId);
    } catch (e) {
      loggy.error('Failed to watch note: $e');
      return Stream.error(e);
    }
  }
}