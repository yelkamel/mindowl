import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service/auth_repository.dart';
import 'service/speech_recognition_repository.dart';
import 'service/audio_recording_repository.dart';

IAuthRepository get authRepo => GetIt.instance<IAuthRepository>();
ISpeechRecognitionRepository get speechRepo =>
    GetIt.instance<ISpeechRecognitionRepository>();
IAudioRecordingRepository get audioRepo => GetIt.instance<IAudioRecordingRepository>();

@InjectableInit(preferRelativeImports: true, asExtension: true)
void initRepository() {
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
