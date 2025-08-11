import 'package:fpdart/fpdart.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class PauseSessionUseCase with MyLog {
  PauseSessionUseCase();

  Future<Either<UseCaseFailure, Session>> call({
    required String uid,
    required String sessionId,
  }) async {
    try {
      final session = await sessionRepo.getSession(uid, sessionId);
      if (session == null) {
        return left(UseCaseFailure('Session not found'));
      }

      if (session.status != SessionStatus.running) {
        return left(UseCaseFailure('Session is not running'));
      }

      final updatedSession = session.copyWith(
        status: SessionStatus.paused,
      );

      await sessionRepo.updateSession(uid, updatedSession);
      loggy.info('Session paused: $sessionId');
      return right(updatedSession);
    } catch (e) {
      loggy.error('Failed to pause session: $e');
      return left(UseCaseFailure('Failed to pause session', e));
    }
  }
}