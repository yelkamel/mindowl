import 'package:fpdart/fpdart.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class PopExoForSessionUseCase with MyLog {
  PopExoForSessionUseCase();

  Future<Either<UseCaseFailure, SessionExo?>> call({
    required String sessionId,
  }) async {
    try {
      // Backend automatically creates exos, just fetch the next pending one
      final sessionExos = await sessionExoRepo.getSessionExos(
        authRepo.uid,
        sessionId,
      );

      // Find the first pending exo
      final pendingExos = sessionExos
          .where((exo) => exo.status == SessionExoStatus.pending)
          .toList();

      if (pendingExos.isEmpty) {
        loggy.info('No pending exos found for session: $sessionId');
        return right(null);
      }

      // Return the first pending exo
      final nextExo = pendingExos.first;
      loggy.info('Found pending exo for session: ${nextExo.id}');
      return right(nextExo);
    } catch (e) {
      loggy.error('Failed to get exo for session: $e');
      return left(UseCaseFailure('Failed to get exo for session', e));
    }
  }
}
