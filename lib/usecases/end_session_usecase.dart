import 'package:fpdart/fpdart.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class EndSessionUseCase with MyLog {
  EndSessionUseCase();

  Future<Either<UseCaseFailure, Session>> call({
    required String sessionId,
  }) async {
    try {
      final uid = authRepo.uid;
      final session = await sessionRepo.getSession(uid, sessionId);
      if (session == null) {
        return left(UseCaseFailure('Session not found'));
      }

      final updatedSession = session.copyWith(
        status: SessionStatus.ended,
        endedAt: DateTime.now(),
      );

      await sessionRepo.updateSession(uid, updatedSession);
      loggy.info('Session ended: $sessionId');
      return right(updatedSession);
    } catch (e) {
      loggy.error('Failed to end session: $e');
      return left(UseCaseFailure('Failed to end session', e));
    }
  }
}