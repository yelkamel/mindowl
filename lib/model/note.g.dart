// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Note _$NoteFromJson(Map<String, dynamic> json) => _Note(
  id: json['id'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String?,
  createdAt: const TimestampDateTimeConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampDateTimeConverter().fromJson(json['updatedAt']),
  lastReviewed: const NullableTimestampDateTimeConverter().fromJson(
    json['lastReviewed'],
  ),
  topics: (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
  primaryTheme: json['primaryTheme'] as String,
  isFavorite: json['isFavorite'] as bool? ?? false,
  markdownContent: json['markdownContent'] as String,
  relatedNoteIds:
      (json['relatedNoteIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  sessionIds:
      (json['sessionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  exoIds:
      (json['exoIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$NoteToJson(_Note instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
  'createdAt': const TimestampDateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampDateTimeConverter().toJson(instance.updatedAt),
  'lastReviewed': const NullableTimestampDateTimeConverter().toJson(
    instance.lastReviewed,
  ),
  'topics': instance.topics,
  'primaryTheme': instance.primaryTheme,
  'isFavorite': instance.isFavorite,
  'markdownContent': instance.markdownContent,
  'relatedNoteIds': instance.relatedNoteIds,
  'sessionIds': instance.sessionIds,
  'exoIds': instance.exoIds,
};
