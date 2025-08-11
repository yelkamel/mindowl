import 'package:fpdart/fpdart.dart';
import 'package:layou_tools/layou_tools.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class PopExoForSessionUseCase with MyLog {
  PopExoForSessionUseCase();

  Future<Either<UseCaseFailure, SessionExo?>> call({
    required String uid,
    required String sessionId,
  }) async {
    try {
      final session = await sessionRepo.getSession(uid, sessionId);
      if (session == null) {
        return left(UseCaseFailure('Session not found'));
      }

      final sinceCreatedAt = session.lastSeenExoCreatedAt ?? session.createdAt;
      
      final newExos = await noteRepo.getNewExosAfter(
        uid, 
        session.noteId, 
        sinceCreatedAt,
        limit: 1,
      );

      if (newExos.isEmpty) {
        loggy.info('No new exos found for session: $sessionId');
        return right(null);
      }

      final exo = newExos.first;
      final sessionExoId = generateRandomId();
      
      final sessionExo = SessionExo(
        id: sessionExoId,
        sessionId: sessionId,
        noteId: session.noteId,
        exoId: exo.id,
        spawnedAt: DateTime.now(),
        status: SessionExoStatus.pending,
        snapshotLite: exo.content,
      );

      final createdSessionExo = await sessionExoRepo.createSessionExo(uid, sessionExo);

      final updatedSession = session.copyWith(
        lastSeenExoCreatedAt: exo.createdAt,
      );
      await sessionRepo.updateSession(uid, updatedSession);

      loggy.info('Exo attached to session: ${sessionExo.id}');
      return right(createdSessionExo);
    } catch (e) {
      loggy.error('Failed to pop exo for session: $e');
      return left(UseCaseFailure('Failed to pop exo for session', e));
    }
  }
}