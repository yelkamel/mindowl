import 'dart:async';
import 'dart:io';
import 'package:whisper_flutter_new/whisper_flutter_new.dart';
import 'package:mindowl/utils/log.dart';
import 'package:mindowl/repository/injection.dart';

abstract class ISpeechRecognitionRepository {
  bool get isListening;
  Stream<bool> get isListeningStream;
  Future<void> initialize();
  Future<void> startListening({required Function(String) onTextChunk});
  Future<void> stopListening();
  void dispose();
}

class SpeechRecognitionRepository
    with MyLog
    implements ISpeechRecognitionRepository {
  Whisper? _whisper;
  Timer? _recordingTimer;
  StreamController<bool>? _isListeningController;
  bool _isInitialized = false;
  bool _isListening = false;
  Function(String)? _onTextChunk;

  @override
  bool get isListening => _isListening;

  @override
  Stream<bool> get isListeningStream =>
      _isListeningController?.stream ?? const Stream.empty();

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      _whisper = Whisper(
        model: WhisperModel.base,
        downloadHost:
            "https://huggingface.co/ggerganov/whisper.cpp/resolve/main",
      );
      _isListeningController = StreamController<bool>.broadcast();

      // Initialize audio recording repository
      final audioInitialized = await audioRepo.initialize();
      if (!audioInitialized) {
        throw Exception('Failed to initialize audio recording');
      }

      _isInitialized = true;
      loggy.info('Speech recognition initialized successfully');
    } catch (e) {
      loggy.error('Failed to initialize speech recognition: $e');
      rethrow;
    }
  }

  @override
  Future<void> startListening({required Function(String) onTextChunk}) async {
    if (!_isInitialized) {
      throw StateError(
        'Speech recognition not initialized. Call initialize() first.',
      );
    }

    if (_isListening) {
      loggy.warning('Already listening. Stop current session first.');
      return;
    }

    try {
      _onTextChunk = onTextChunk;
      _isListening = true;
      _isListeningController?.add(true);

      // Start initial recording
      await _startRecordingChunk();

      _recordingTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
        _processAudioChunk();
      });

      loggy.info('Started listening for speech recognition');
    } catch (e) {
      _isListening = false;
      _isListeningController?.add(false);
      loggy.error('Failed to start listening: $e');
      rethrow;
    }
  }

  @override
  Future<void> stopListening() async {
    if (!_isListening) return;

    try {
      _recordingTimer?.cancel();
      _recordingTimer = null;

      // Stop any ongoing recording
      if (audioRepo.isRecording) {
        await audioRepo.stopRecording();
      }

      _isListening = false;
      _isListeningController?.add(false);
      _onTextChunk = null;

      loggy.info('Stopped listening for speech recognition');
    } catch (e) {
      loggy.error('Error stopping speech recognition: $e');
      rethrow;
    }
  }

  Future<void> _processAudioChunk() async {
    if (!_isListening || _onTextChunk == null || _whisper == null) return;

    try {
      // Stop current recording and get the audio file
      final audioPath = await audioRepo.stopRecording();

      if (audioPath != null && await File(audioPath).exists()) {
        // Transcribe the recorded audio
        final transcription = await _whisper!.transcribe(
          transcribeRequest: TranscribeRequest(
            audio: audioPath,
            isTranslate: false,
            isNoTimestamps: true,
            splitOnWord: true,
          ),
        );

        if (transcription.text.isNotEmpty) {
          final textChunk = transcription.text.trim();
          if (textChunk.isNotEmpty) {
            _onTextChunk!(textChunk);
            loggy.debug(
              'Processed text chunk: ${textChunk.substring(0, textChunk.length > 50 ? 50 : textChunk.length)}...',
            );
          }
        }

        // Clean up the temporary file
        try {
          await File(audioPath).delete();
        } catch (e) {
          loggy.warning('Failed to delete temporary audio file: $e');
        }
      }

      // Start recording for the next chunk if still listening
      if (_isListening) {
        await _startRecordingChunk();
      }
    } catch (e) {
      loggy.error('Error processing audio chunk: $e');
      // Try to start recording again if still listening
      if (_isListening) {
        await _startRecordingChunk();
      }
    }
  }

  Future<void> _startRecordingChunk() async {
    try {
      await audioRepo.startRecording();
      loggy.debug('Started recording audio chunk');
    } catch (e) {
      loggy.error('Error starting audio recording: $e');
    }
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    _recordingTimer = null;

    if (_isListening) {
      stopListening();
    }

    _isListeningController?.close();
    _isListeningController = null;

    audioRepo.dispose();
    _whisper = null;
    _isInitialized = false;
    _onTextChunk = null;

    loggy.info('Speech recognition repository disposed');
  }
}
