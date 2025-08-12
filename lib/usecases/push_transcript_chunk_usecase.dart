import 'package:fpdart/fpdart.dart';
import 'package:layou_tools/layou_tools.dart';
import 'package:mindowl/model/transcript.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class PushTranscriptChunkUseCase with MyLog {
  PushTranscriptChunkUseCase();

  Future<Either<UseCaseFailure, Transcript>> call({
    required String sessionId,
    required double startSec,
    required double endSec,
    required String text,
  }) async {
    try {
      final uid = authRepo.uid;
      final chunkId = generateRandomId();
      final transcript = Transcript(
        id: chunkId,
        sessionId: sessionId,
        startSec: startSec,
        endSec: endSec,
        text: text,
        processed: false,
        createdAt: DateTime.now(),
      );

      // Write to chunks collection - backend will handle note creation/update and exo generation
      final createdTranscript = await transcriptRepo.createTranscript(uid, transcript);
      loggy.info('Transcript chunk pushed: $sessionId');
      return right(createdTranscript);
    } catch (e) {
      loggy.error('Failed to push transcript chunk: $e');
      return left(UseCaseFailure('Failed to push transcript chunk', e));
    }
  }
}