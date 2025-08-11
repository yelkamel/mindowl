// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Attempt _$AttemptFromJson(Map<String, dynamic> json) => _Attempt(
  id: json['id'] as String,
  sessionId: json['sessionId'] as String,
  exoId: json['exoId'] as String,
  noteId: json['noteId'] as String,
  answeredAt: const TimestampDateTimeConverter().fromJson(json['answeredAt']),
  isCorrect: json['isCorrect'] as bool,
  timeToAnswerMs: (json['timeToAnswerMs'] as num).toInt(),
  userAnswer: json['userAnswer'],
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$AttemptToJson(_Attempt instance) => <String, dynamic>{
  'id': instance.id,
  'sessionId': instance.sessionId,
  'exoId': instance.exoId,
  'noteId': instance.noteId,
  'answeredAt': const TimestampDateTimeConverter().toJson(instance.answeredAt),
  'isCorrect': instance.isCorrect,
  'timeToAnswerMs': instance.timeToAnswerMs,
  'userAnswer': instance.userAnswer,
  'metadata': instance.metadata,
};
