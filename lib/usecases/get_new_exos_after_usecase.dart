import 'package:fpdart/fpdart.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class GetNewExosAfterUseCase with MyLog {
  GetNewExosAfterUseCase();

  Future<Either<UseCaseFailure, List<Exo>>> call({
    required String noteId,
    required DateTime sinceCreatedAt,
    int limit = 10,
  }) async {
    try {
      final uid = authRepo.uid;
      final exos = await noteRepo.getNewExosAfter(uid, noteId, sinceCreatedAt, limit: limit);
      loggy.info('Found ${exos.length} new exos for note: $noteId since: $sinceCreatedAt');
      return right(exos);
    } catch (e) {
      loggy.error('Failed to get new exos after: $e');
      return left(UseCaseFailure('Failed to get new exos after', e));
    }
  }
}