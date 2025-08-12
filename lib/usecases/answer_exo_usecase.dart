import 'package:fpdart/fpdart.dart';
import 'package:layou_tools/layou_tools.dart';
import 'package:mindowl/model/attempt.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class AnswerExoUseCase with MyLog {
  AnswerExoUseCase();

  Future<Either<UseCaseFailure, Attempt>> call({
    required String sessionId,
    required String sessionExoId,
    required String noteId,
    required String exoId,
    required dynamic userAnswer,
    required bool isCorrect,
    required int timeToAnswerMs,
  }) async {
    try {
      final uid = authRepo.uid;
      final attemptId = generateRandomId();
      final attempt = Attempt(
        id: attemptId,
        sessionId: sessionId,
        exoId: exoId,
        noteId: noteId,
        answeredAt: DateTime.now(),
        isCorrect: isCorrect,
        timeToAnswerMs: timeToAnswerMs,
        userAnswer: userAnswer,
      );

      final createdAttempt = await attemptRepo.createAttempt(uid, attempt);
      loggy.info('Answer recorded: $sessionId');

      final sessionExo = await sessionExoRepo.getSessionExo(uid, sessionId, sessionExoId);
      if (sessionExo != null) {
        final updatedSessionExo = sessionExo.copyWith(
          status: SessionExoStatus.answered,
        );
        await sessionExoRepo.updateSessionExo(uid, updatedSessionExo);
      }

      loggy.info('Exo answered: $exoId with result: ${isCorrect ? 'correct' : 'incorrect'}');
      return right(createdAttempt);
    } catch (e) {
      loggy.error('Failed to answer exo: $e');
      return left(UseCaseFailure('Failed to answer exo', e));
    }
  }
}