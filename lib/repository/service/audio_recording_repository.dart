import 'dart:async';
import 'dart:io';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mindowl/utils/log.dart';

abstract class IAudioRecordingRepository {
  bool get isRecording;
  Stream<bool> get isRecordingStream;
  Future<bool> initialize();
  Future<void> startRecording();
  Future<String?> stopRecording();
  Future<String?> recordForDuration(Duration duration);
  void dispose();
}

class AudioRecordingRepository with MyLog implements IAudioRecordingRepository {
  final AudioRecorder _recorder = AudioRecorder();
  StreamController<bool>? _isRecordingController;
  bool _isInitialized = false;
  bool _isRecording = false;
  String? _currentRecordingPath;

  @override
  bool get isRecording => _isRecording;

  @override
  Stream<bool> get isRecordingStream => _isRecordingController?.stream ?? const Stream.empty();

  @override
  Future<bool> initialize() async {
    if (_isInitialized) return true;

    try {
      final hasPermission = await _requestPermissions();
      if (!hasPermission) {
        loggy.error('Audio recording permission denied');
        return false;
      }

      _isRecordingController = StreamController<bool>.broadcast();
      _isInitialized = true;
      loggy.info('Audio recording initialized successfully');
      return true;
    } catch (e) {
      loggy.error('Failed to initialize audio recording: $e');
      return false;
    }
  }

  Future<bool> _requestPermissions() async {
    try {
      final microphoneStatus = await Permission.microphone.request();
      return microphoneStatus.isGranted;
    } catch (e) {
      loggy.error('Error requesting permissions: $e');
      return false;
    }
  }

  @override
  Future<void> startRecording() async {
    if (!_isInitialized) {
      throw StateError('Audio recording not initialized. Call initialize() first.');
    }

    if (_isRecording) {
      loggy.warning('Already recording. Stop current recording first.');
      return;
    }

    try {
      final directory = await getTemporaryDirectory();
      _currentRecordingPath = '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.wav';

      await _recorder.start(
        RecordConfig(
          encoder: AudioEncoder.wav,
          sampleRate: 16000,
          bitRate: 128000,
        ),
        path: _currentRecordingPath!,
      );

      _isRecording = true;
      _isRecordingController?.add(true);
      loggy.info('Started recording audio to: $_currentRecordingPath');
    } catch (e) {
      _isRecording = false;
      _isRecordingController?.add(false);
      loggy.error('Failed to start recording: $e');
      rethrow;
    }
  }

  @override
  Future<String?> stopRecording() async {
    if (!_isRecording) return null;

    try {
      final path = await _recorder.stop();
      _isRecording = false;
      _isRecordingController?.add(false);

      final recordedPath = path ?? _currentRecordingPath;
      _currentRecordingPath = null;

      if (recordedPath != null && await File(recordedPath).exists()) {
        loggy.info('Recording stopped successfully: $recordedPath');
        return recordedPath;
      } else {
        loggy.warning('Recording file not found after stopping');
        return null;
      }
    } catch (e) {
      _isRecording = false;
      _isRecordingController?.add(false);
      _currentRecordingPath = null;
      loggy.error('Error stopping recording: $e');
      rethrow;
    }
  }

  @override
  Future<String?> recordForDuration(Duration duration) async {
    try {
      await startRecording();
      await Future.delayed(duration);
      return await stopRecording();
    } catch (e) {
      loggy.error('Error during timed recording: $e');
      if (_isRecording) {
        await stopRecording();
      }
      return null;
    }
  }

  @override
  void dispose() {
    if (_isRecording) {
      stopRecording();
    }
    
    _isRecordingController?.close();
    _isRecordingController = null;
    _recorder.dispose();
    _isInitialized = false;
    _currentRecordingPath = null;
    
    loggy.info('Audio recording repository disposed');
  }
}