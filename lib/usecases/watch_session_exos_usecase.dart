import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/utils/log.dart';

class WatchSessionExosUseCase with MyLog {
  WatchSessionExosUseCase();

  Stream<List<SessionExo>> call({
    required String sessionId,
  }) {
    try {
      final uid = authRepo.uid;
      loggy.info('Watching session exos for session: $sessionId');
      return sessionExoRepo.watchSessionExos(uid, sessionId);
    } catch (e) {
      loggy.error('Failed to watch session exos: $e');
      return Stream.error(e);
    }
  }
}