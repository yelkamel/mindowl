import 'package:fpdart/fpdart.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class AdvanceQuizCursorUseCase with MyLog {
  AdvanceQuizCursorUseCase();

  Future<Either<UseCaseFailure, SessionExo?>> call({
    required String uid,
    required String sessionId,
  }) async {
    try {
      final sessionExos = await sessionExoRepo.getSessionExos(uid, sessionId);
      
      final pendingExos = sessionExos
          .where((exo) => exo.status == SessionExoStatus.pending)
          .toList();

      if (pendingExos.isEmpty) {
        loggy.info('No pending exos found for session: $sessionId');
        return right(null);
      }

      final nextExo = pendingExos.first;
      loggy.info('Next quiz exo found: ${nextExo.id}');
      return right(nextExo);
    } catch (e) {
      loggy.error('Failed to advance quiz cursor: $e');
      return left(UseCaseFailure('Failed to advance quiz cursor', e));
    }
  }
}