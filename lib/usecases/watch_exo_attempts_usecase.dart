import 'package:mindowl/model/attempt.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/utils/log.dart';

class WatchExoAttemptsUseCase with MyLog {
  WatchExoAttemptsUseCase();

  Stream<List<Attempt>> call({
    required String noteId,
    required String exoId,
  }) {
    try {
      final uid = authRepo.uid;
      loggy.info('Watching attempts for exo: $exoId in note: $noteId');
      return attemptRepo.watchExoAttempts(uid, noteId, exoId);
    } catch (e) {
      loggy.error('Failed to watch exo attempts: $e');
      return Stream.error(e);
    }
  }
}