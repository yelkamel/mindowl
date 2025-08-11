// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['id'] as String,
  noteId: json['noteId'] as String,
  title: json['title'] as String,
  type: $enumDecode(_$SessionTypeEnumMap, json['type']),
  status:
      $enumDecodeNullable(_$SessionStatusEnumMap, json['status']) ??
      SessionStatus.idle,
  createdAt: const TimestampDateTimeConverter().fromJson(json['createdAt']),
  startedAt: const NullableTimestampDateTimeConverter().fromJson(
    json['startedAt'],
  ),
  endedAt: const NullableTimestampDateTimeConverter().fromJson(json['endedAt']),
  lastSeenExoCreatedAt: const NullableTimestampDateTimeConverter().fromJson(
    json['lastSeenExoCreatedAt'],
  ),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, dynamic>{},
  source: json['source'] as String?,
  platform: json['platform'] as String?,
  date: const TimestampDateTimeConverter().fromJson(json['date']),
  duration: (json['duration'] as num?)?.toInt(),
  liveScore: (json['liveScore'] as num?)?.toDouble(),
  context: json['context'] as String?,
  exoIds:
      (json['exoIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  completedAt: const NullableTimestampDateTimeConverter().fromJson(
    json['completedAt'],
  ),
  totalQuestions: (json['totalQuestions'] as num?)?.toInt(),
  currentQuestionIndex: (json['currentQuestionIndex'] as num?)?.toInt(),
  finalScore: (json['finalScore'] as num?)?.toDouble(),
  correctAnswers: (json['correctAnswers'] as num?)?.toInt(),
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'noteId': instance.noteId,
  'title': instance.title,
  'type': _$SessionTypeEnumMap[instance.type]!,
  'status': _$SessionStatusEnumMap[instance.status]!,
  'createdAt': const TimestampDateTimeConverter().toJson(instance.createdAt),
  'startedAt': const NullableTimestampDateTimeConverter().toJson(
    instance.startedAt,
  ),
  'endedAt': const NullableTimestampDateTimeConverter().toJson(
    instance.endedAt,
  ),
  'lastSeenExoCreatedAt': const NullableTimestampDateTimeConverter().toJson(
    instance.lastSeenExoCreatedAt,
  ),
  'metadata': instance.metadata,
  'source': instance.source,
  'platform': instance.platform,
  'date': _$JsonConverterToJson<Object?, DateTime>(
    instance.date,
    const TimestampDateTimeConverter().toJson,
  ),
  'duration': instance.duration,
  'liveScore': instance.liveScore,
  'context': instance.context,
  'exoIds': instance.exoIds,
  'completedAt': const NullableTimestampDateTimeConverter().toJson(
    instance.completedAt,
  ),
  'totalQuestions': instance.totalQuestions,
  'currentQuestionIndex': instance.currentQuestionIndex,
  'finalScore': instance.finalScore,
  'correctAnswers': instance.correctAnswers,
};

const _$SessionTypeEnumMap = {
  SessionType.listening: 'listening',
  SessionType.quiz: 'quiz',
};

const _$SessionStatusEnumMap = {
  SessionStatus.idle: 'idle',
  SessionStatus.running: 'running',
  SessionStatus.paused: 'paused',
  SessionStatus.ended: 'ended',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
