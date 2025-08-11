import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:mindowl/model/user.dart' as app;
import 'package:mindowl/repository/database/user_repository.dart';
import 'package:mindowl/repository/service/auth_repository.dart';
import 'package:mindowl/usecases/user_logged_anonymously_usecase.dart';

import 'user_logged_anonymously_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository, IUserRepository])
void main() {
  late MockIAuthRepository mockAuthRepository;
  late MockIUserRepository mockUserRepository;
  late GetIt getIt;

  setUp(() async {
    getIt = GetIt.instance;
    await getIt.reset();

    mockAuthRepository = MockIAuthRepository();
    mockUserRepository = MockIUserRepository();

    // Provide dummy User for mockito
    provideDummy<app.User>(app.User(
      uid: 'dummy-uid',
      email: 'dummy@example.com',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      micropermission: false,
    ));

    getIt.registerSingleton<IAuthRepository>(mockAuthRepository);
    getIt.registerSingleton<IUserRepository>(mockUserRepository);
  });

  tearDown(() async {
    await getIt.reset();
  });

  group('UserLoggedAnonymouslyUseCase', () {
    test('returns existing user when user already exists', () async {
      // arrange
      const uid = 'uid-123';
      final existingUser = app.User(
        uid: uid,
        email: '',
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
        micropermission: false,
      );

      when(mockAuthRepository.loginUserAnonymously()).thenAnswer((_) async {});
      when(mockAuthRepository.uid).thenReturn(uid);
      when(mockUserRepository.userExists(uid)).thenAnswer((_) async => true);
      when(mockUserRepository.getUser(uid)).thenAnswer((_) async => existingUser);

      final useCase = UserLoggedAnonymouslyUseCase();

      // act
      final result = await useCase();

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success, got error: ${failure.message}'),
        (user) => expect(user.uid, uid),
      );

      verify(mockAuthRepository.loginUserAnonymously()).called(1);
      verify(mockAuthRepository.uid).called(1);
      verify(mockUserRepository.userExists(uid)).called(1);
      verify(mockUserRepository.getUser(uid)).called(1);
    });

    test('creates new user when user does not exist', () async {
      // arrange
      const uid = 'uid-456';

      when(mockAuthRepository.loginUserAnonymously()).thenAnswer((_) async {});
      when(mockAuthRepository.uid).thenReturn(uid);
      when(mockUserRepository.userExists(uid)).thenAnswer((_) async => false);
      when(mockUserRepository.createUser(any)).thenAnswer((invocation) async {
        final user = invocation.positionalArguments.first as app.User;
        return user;
      });

      final useCase = UserLoggedAnonymouslyUseCase();

      // act
      final result = await useCase();

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success, got error: ${failure.message}'),
        (user) => {
          expect(user.uid, uid),
          expect(user.email, ''),
          expect(user.micropermission, false),
        },
      );

      verify(mockAuthRepository.loginUserAnonymously()).called(1);
      verify(mockAuthRepository.uid).called(1);
      verify(mockUserRepository.userExists(uid)).called(1);
      verify(mockUserRepository.createUser(any)).called(1);
    });

    test('returns error when uid is empty', () async {
      // arrange
      when(mockAuthRepository.loginUserAnonymously()).thenAnswer((_) async {});
      when(mockAuthRepository.uid).thenReturn('');

      final useCase = UserLoggedAnonymouslyUseCase();

      // act
      final result = await useCase();

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure.message, contains('Invalid user ID')),
        (user) => fail('Expected error, got success'),
      );

      verify(mockAuthRepository.loginUserAnonymously()).called(1);
      verify(mockAuthRepository.uid).called(1);
      verifyNever(mockUserRepository.userExists(any));
    });

    test('handles Firebase auth exception', () async {
      // arrange
      when(mockAuthRepository.loginUserAnonymously()).thenThrow(
        auth.FirebaseAuthException(
          code: 'operation-not-allowed',
          message: 'not enabled',
        ),
      );

      final useCase = UserLoggedAnonymouslyUseCase();

      // act
      final result = await useCase();

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure.message, contains('Anonymous authentication is not enabled')),
        (user) => fail('Expected error, got success'),
      );

      verify(mockAuthRepository.loginUserAnonymously()).called(1);
      verifyNever(mockUserRepository.userExists(any));
    });

    test('handles unexpected exception', () async {
      // arrange
      const uid = 'uid-error';
      when(mockAuthRepository.loginUserAnonymously()).thenAnswer((_) async {});
      when(mockAuthRepository.uid).thenReturn(uid);
      when(mockUserRepository.userExists(uid)).thenThrow(Exception('Database error'));

      final useCase = UserLoggedAnonymouslyUseCase();

      // act
      final result = await useCase();

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure.message, contains('Login failed')),
        (user) => fail('Expected error, got success'),
      );

      verify(mockAuthRepository.loginUserAnonymously()).called(1);
      verify(mockAuthRepository.uid).called(1);
      verify(mockUserRepository.userExists(uid)).called(1);
    });
  });
}