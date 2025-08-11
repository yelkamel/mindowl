import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:mindowl/model/user.dart';
import 'package:mindowl/repository/service/auth_repository.dart';

import 'package:mindowl/repository/database/user_repository.dart';
import 'package:mindowl/usecases/failure.dart';
import 'package:mindowl/utils/log.dart';

class UserLoggedAnonymouslyUseCase with MyLog {
  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;

  UserLoggedAnonymouslyUseCase(this._authRepository, this._userRepository);

  Future<Either<UseCaseFailure, User>> call() async {
    try {
      await _authRepository.loginUserAnonymously();
      final uid = _authRepository.uid;

      if (uid.isEmpty) {
        loggy.error('Anonymous login succeeded but uid is empty');
        return left(UseCaseFailure('Authentication failed: Invalid user ID'));
      }

      final exists = await _userRepository.userExists(uid);

      if (exists) {
        final user = await _userRepository.getUser(uid);
        if (user == null) {
          return left(
            UseCaseFailure('User document exists but could not be retrieved'),
          );
        }
        loggy.info('Returning user logged in anonymously: $uid');
        return right(user);
      } else {
        final newUser = User(
          uid: uid,
          createdAt: DateTime.now(),
          email: '',
          updatedAt: DateTime.now(),
          micropermission: false,
        );

        final user = await _userRepository.createUser(newUser);
        loggy.info('New user logged in anonymously and created: $uid');
        return right(user);
      }
    } on auth.FirebaseAuthException catch (e) {
      loggy.error(
        'Firebase Auth error during anonymous login: ${e.code} - ${e.message}',
      );

      String userFriendlyMessage;
      switch (e.code) {
        case 'operation-not-allowed':
          userFriendlyMessage = 'Anonymous authentication is not enabled';
          break;
        case 'network-request-failed':
          userFriendlyMessage = 'Network error. Please check your connection';
          break;
        default:
          userFriendlyMessage = 'Authentication failed. Please try again';
      }

      return left(UseCaseFailure(userFriendlyMessage, e));
    } catch (e) {
      loggy.error('Unexpected error during anonymous login: $e');
      return left(UseCaseFailure('Login failed. Please try again', e));
    }
  }
}
