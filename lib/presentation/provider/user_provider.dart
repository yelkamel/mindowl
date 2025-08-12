import 'package:mindowl/repository/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mindowl/model/user.dart';

part 'user_provider.g.dart';

@riverpod
Future<User?> currentUser(Ref ref) async {
  ref.watch(userConnectedProvider);
  final uid = authRepo.uid;
  if (authRepo.isAnonymous) {
    return null;
  }

  if (uid.isEmpty) {
    return null;
  }

  return await userRepo.getUser(uid);
}

/// Provides a real-time stream of the current user's data
@Riverpod(keepAlive: true)
Stream<User?> user(Ref ref) {
  ref.watch(userConnectedProvider);
  final uid = authRepo.uid;
  if (authRepo.isAnonymous) {
    return Stream.value(null);
  }

  if (uid.isEmpty) {
    return Stream.value(null);
  }
  return userRepo.streamUser(authRepo.uid);
}

@riverpod
Stream<bool> userConnected(Ref ref) {
  return authRepo.uidStream.map((uid) => uid.isNotEmpty);
}
