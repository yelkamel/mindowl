import 'package:fpdart/fpdart.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class StartSessionUseCase with MyLog {
  StartSessionUseCase();

  Future<Either<UseCaseFailure, Session>> call({
    required String uid,
    required String sessionId,
  }) async {
    try {
      final session = await sessionRepo.getSession(uid, sessionId);
      if (session == null) {
        return left(UseCaseFailure('Session not found'));
      }

      final updatedSession = session.copyWith(
        status: SessionStatus.running,
        startedAt: DateTime.now(),
      );

      await sessionRepo.updateSession(uid, updatedSession);
      loggy.info('Session started: $sessionId');
      return right(updatedSession);
    } catch (e) {
      loggy.error('Failed to start session: $e');
      return left(UseCaseFailure('Failed to start session', e));
    }
  }
}