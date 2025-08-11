// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Exo _$ExoFromJson(Map<String, dynamic> json) => _Exo(
  id: json['id'] as String,
  noteId: json['noteId'] as String,
  sessionId: json['sessionId'] as String?,
  type: $enumDecode(_$ExoTypeEnumMap, json['type']),
  content: ExoContent.fromJson(json['content'] as Map<String, dynamic>),
  difficulty: (json['difficulty'] as num?)?.toInt() ?? 1,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  createdAt: const TimestampDateTimeConverter().fromJson(json['createdAt']),
  question: json['question'] as String?,
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  correctAnswer: json['correctAnswer'],
  xpReward: (json['xpReward'] as num?)?.toInt(),
  explanation: json['explanation'] as String?,
  lastAttempted: const NullableTimestampDateTimeConverter().fromJson(
    json['lastAttempted'],
  ),
  correctAttempts: (json['correctAttempts'] as num?)?.toInt() ?? 0,
  totalAttempts: (json['totalAttempts'] as num?)?.toInt() ?? 0,
  isAnswered: json['isAnswered'] as bool? ?? false,
  userAnswer: json['userAnswer'],
  isCorrect: json['isCorrect'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$ExoToJson(_Exo instance) => <String, dynamic>{
  'id': instance.id,
  'noteId': instance.noteId,
  'sessionId': instance.sessionId,
  'type': _$ExoTypeEnumMap[instance.type]!,
  'content': instance.content,
  'difficulty': instance.difficulty,
  'tags': instance.tags,
  'createdAt': const TimestampDateTimeConverter().toJson(instance.createdAt),
  'question': instance.question,
  'options': instance.options,
  'correctAnswer': instance.correctAnswer,
  'xpReward': instance.xpReward,
  'explanation': instance.explanation,
  'lastAttempted': const NullableTimestampDateTimeConverter().toJson(
    instance.lastAttempted,
  ),
  'correctAttempts': instance.correctAttempts,
  'totalAttempts': instance.totalAttempts,
  'isAnswered': instance.isAnswered,
  'userAnswer': instance.userAnswer,
  'isCorrect': instance.isCorrect,
  'isFavorite': instance.isFavorite,
};

const _$ExoTypeEnumMap = {
  ExoType.mcq: 'mcq',
  ExoType.truefalse: 'truefalse',
  ExoType.cloze: 'cloze',
  ExoType.ordering: 'ordering',
  ExoType.short: 'short',
};

_ExoContent _$ExoContentFromJson(Map<String, dynamic> json) => _ExoContent(
  question: json['question'] as String,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  answer: json['answer'],
  explanation: json['explanation'] as String?,
);

Map<String, dynamic> _$ExoContentToJson(_ExoContent instance) =>
    <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'answer': instance.answer,
      'explanation': instance.explanation,
    };
