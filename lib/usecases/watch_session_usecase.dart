import 'package:mindowl/model/session.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/utils/log.dart';

class WatchSessionUseCase with MyLog {
  WatchSessionUseCase();

  Stream<Session?> call({
    required String sessionId,
  }) {
    try {
      final uid = authRepo.uid;
      loggy.info('Watching session: $sessionId');
      return sessionRepo.watchSession(uid, sessionId);
    } catch (e) {
      loggy.error('Failed to watch session: $e');
      return Stream.error(e);
    }
  }
}