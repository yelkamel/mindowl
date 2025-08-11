// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transcript _$TranscriptFromJson(Map<String, dynamic> json) => _Transcript(
  id: json['id'] as String,
  sessionId: json['sessionId'] as String,
  startSec: (json['startSec'] as num).toDouble(),
  endSec: (json['endSec'] as num).toDouble(),
  text: json['text'] as String,
  processed: json['processed'] as bool? ?? false,
  createdAt: const TimestampDateTimeConverter().fromJson(json['createdAt']),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$TranscriptToJson(
  _Transcript instance,
) => <String, dynamic>{
  'id': instance.id,
  'sessionId': instance.sessionId,
  'startSec': instance.startSec,
  'endSec': instance.endSec,
  'text': instance.text,
  'processed': instance.processed,
  'createdAt': const TimestampDateTimeConverter().toJson(instance.createdAt),
  'metadata': instance.metadata,
};
