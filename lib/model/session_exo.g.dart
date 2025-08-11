// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_exo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionExo _$SessionExoFromJson(Map<String, dynamic> json) => _SessionExo(
  id: json['id'] as String,
  sessionId: json['sessionId'] as String,
  noteId: json['noteId'] as String,
  exoId: json['exoId'] as String,
  spawnedAt: const TimestampDateTimeConverter().fromJson(json['spawnedAt']),
  status:
      $enumDecodeNullable(_$SessionExoStatusEnumMap, json['status']) ??
      SessionExoStatus.pending,
  snapshotLite: json['snapshotLite'] == null
      ? null
      : ExoContent.fromJson(json['snapshotLite'] as Map<String, dynamic>),
  metadata:
      json['metadata'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$SessionExoToJson(
  _SessionExo instance,
) => <String, dynamic>{
  'id': instance.id,
  'sessionId': instance.sessionId,
  'noteId': instance.noteId,
  'exoId': instance.exoId,
  'spawnedAt': const TimestampDateTimeConverter().toJson(instance.spawnedAt),
  'status': _$SessionExoStatusEnumMap[instance.status]!,
  'snapshotLite': instance.snapshotLite,
  'metadata': instance.metadata,
};

const _$SessionExoStatusEnumMap = {
  SessionExoStatus.pending: 'pending',
  SessionExoStatus.answered: 'answered',
  SessionExoStatus.skipped: 'skipped',
};
