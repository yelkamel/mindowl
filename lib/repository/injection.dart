import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mindowl/repository/database/user_repository.dart';
import 'package:mindowl/repository/database/session_repository.dart';
import 'package:mindowl/repository/database/session_exo_repository.dart';
import 'package:mindowl/repository/database/transcript_repository.dart';
import 'package:mindowl/repository/database/attempt_repository.dart';
import 'package:mindowl/repository/database/note_repository.dart';

import 'service/auth_repository.dart';
import 'service/speech_recognition_repository.dart';
import 'service/audio_recording_repository.dart';

// Databases
IUserRepository get userRepo => GetIt.instance<IUserRepository>();
ISessionRepository get sessionRepo => GetIt.instance<ISessionRepository>();
ISessionExoRepository get sessionExoRepo => GetIt.instance<ISessionExoRepository>();
ITranscriptRepository get transcriptRepo => GetIt.instance<ITranscriptRepository>();
IAttemptRepository get attemptRepo => GetIt.instance<IAttemptRepository>();
INoteRepository get noteRepo => GetIt.instance<INoteRepository>();

// Services
IAuthRepository get authRepo => GetIt.instance<IAuthRepository>();
ISpeechRecognitionRepository get speechRepo =>
    GetIt.instance<ISpeechRecognitionRepository>();
IAudioRecordingRepository get audioRepo =>
    GetIt.instance<IAudioRecordingRepository>();

@InjectableInit(preferRelativeImports: true, asExtension: true)
void initRepository() {
  // Databases
  GetIt.instance.registerLazySingleton<IUserRepository>(() => UserRepository());
  GetIt.instance.registerLazySingleton<ISessionRepository>(() => SessionRepository());
  GetIt.instance.registerLazySingleton<ISessionExoRepository>(() => SessionExoRepository());
  GetIt.instance.registerLazySingleton<ITranscriptRepository>(() => TranscriptRepository());
  GetIt.instance.registerLazySingleton<IAttemptRepository>(() => AttemptRepository());
  GetIt.instance.registerLazySingleton<INoteRepository>(() => NoteRepository());

  // Services
  GetIt.instance.registerSingleton<IAuthRepository>(AuthRepository());
  GetIt.instance.registerSingleton<IAudioRecordingRepository>(
    AudioRecordingRepository(),
  );
  GetIt.instance.registerSingleton<ISpeechRecognitionRepository>(
    SpeechRecognitionRepository(),
  );
  GetIt.instance.registerSingleton<FirebaseFirestore>(
    FirebaseFirestore.instance,
  );
}
