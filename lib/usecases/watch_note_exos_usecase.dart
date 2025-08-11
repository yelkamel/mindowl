import 'package:mindowl/model/exo.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/utils/log.dart';

class WatchNoteExosUseCase with MyLog {
  WatchNoteExosUseCase();

  Stream<List<Exo>> call({
    required String uid,
    required String noteId,
    int? limit,
  }) {
    try {
      loggy.info('Watching exos for note: $noteId${limit != null ? ' with limit: $limit' : ''}');
      return noteRepo.watchNoteExos(uid, noteId, limit: limit);
    } catch (e) {
      loggy.error('Failed to watch note exos: $e');
      return Stream.error(e);
    }
  }
}