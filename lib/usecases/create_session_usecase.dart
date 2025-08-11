import 'package:fpdart/fpdart.dart';
import 'package:layou_tools/layou_tools.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class CreateSessionUseCase with MyLog {
  CreateSessionUseCase();

  Future<Either<UseCaseFailure, Session>> call({
    required String uid,
    required SessionType type,
    required String noteId,
    String? title,
  }) async {
    try {
      final sessionId = generateRandomId();
      final session = Session(
        id: sessionId,
        noteId: noteId,
        title: title ?? 'Session ${type.name}',
        type: type,
        status: SessionStatus.idle,
        createdAt: DateTime.now(),
      );

      final createdSession = await sessionRepo.createSession(session);
      loggy.info('Session created: ${createdSession.id}');
      return right(createdSession);
    } catch (e) {
      loggy.error('Failed to create session: $e');
      return left(UseCaseFailure('Failed to create session', e));
    }
  }
}