import 'package:fpdart/fpdart.dart';
import 'package:layou_tools/layou_tools.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class CreateSessionUseCase with MyLog {
  CreateSessionUseCase();

  Future<Either<UseCaseFailure, Session>> call({
    required SessionType type,
    String? noteId, // Now optional - backend creates note on first chunk
  }) async {
    try {
      final sessionId = generateRandomId();
      final session = Session(
        id: sessionId,
        noteId: noteId ?? '', // Empty noteId - backend will set it on first chunk
        title: 'Session ${DateTime.now().toIso8601String()}',
        type: type,
        status: SessionStatus.idle,
        createdAt: DateTime.now(),
      );

      final createdSession = await sessionRepo.createSession(
        authRepo.uid,
        session,
      );
      loggy.info('Session created: ${createdSession.id}');
      return right(createdSession);
    } catch (e) {
      loggy.error('Failed to create session: $e');
      return left(UseCaseFailure('Failed to create session', e));
    }
  }
}
