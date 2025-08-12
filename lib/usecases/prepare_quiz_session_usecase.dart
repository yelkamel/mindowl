import 'package:fpdart/fpdart.dart';
import 'package:layou_tools/layou_tools.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class PrepareQuizSessionUseCase with MyLog {
  PrepareQuizSessionUseCase();

  Future<Either<UseCaseFailure, Session>> call({
    required String noteId,
    required int count,
    String? title,
  }) async {
    try {
      final sessionId = generateRandomId();
      final session = Session(
        id: sessionId,
        noteId: noteId,
        title: title ?? 'Quiz Session',
        type: SessionType.quiz,
        status: SessionStatus.idle,
        createdAt: DateTime.now(),
        totalQuestions: count,
        currentQuestionIndex: 0,
      );

      final createdSession = await sessionRepo.createSession(
        authRepo.uid,
        session,
      );
      loggy.info('Quiz session prepared: ${createdSession.id}');

      final noteExos = await noteRepo
          .watchNoteExos(authRepo.uid, noteId, limit: count)
          .first;

      final selectedExos = noteExos.take(count).toList();

      for (final exo in selectedExos) {
        final sessionExoId = generateRandomId();
        final sessionExo = SessionExo(
          id: sessionExoId,
          sessionId: sessionId,
          noteId: noteId,
          exoId: exo.id,
          spawnedAt: DateTime.now(),
          status: SessionExoStatus.pending,
          snapshotLite: exo.content,
        );
        await sessionExoRepo.createSessionExo(authRepo.uid, sessionExo);
      }

      loggy.info('Quiz session prepared with $count exercises: $sessionId');
      return right(createdSession);
    } catch (e) {
      loggy.error('Failed to prepare quiz session: $e');
      return left(UseCaseFailure('Failed to prepare quiz session', e));
    }
  }
}
