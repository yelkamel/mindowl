import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'attempt.freezed.dart';
part 'attempt.g.dart';

@freezed
sealed class Attempt with _$Attempt {
  const factory Attempt({
    required String id,
    required String sessionId,
    required String exoId,
    required String noteId,
    @TimestampDateTimeConverter() required DateTime answeredAt,
    required bool isCorrect,
    required int timeToAnswerMs,
    required dynamic userAnswer,
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
  }) = _Attempt;

  factory Attempt.fromJson(Map<String, dynamic> json) => _$AttemptFromJson(json);

  const Attempt._();

  Duration get timeToAnswer => Duration(milliseconds: timeToAnswerMs);
  
  String get formattedTime {
    final seconds = timeToAnswerMs / 1000;
    if (seconds < 60) {
      return '${seconds.toStringAsFixed(1)}s';
    } else {
      final minutes = seconds / 60;
      return '${minutes.toStringAsFixed(1)}m';
    }
  }
}