// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  uid: json['uid'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String?,
  photoUrl: json['photoUrl'] as String?,
  createdAt: const TimestampDateTimeConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampDateTimeConverter().fromJson(json['updatedAt']),
  micropermission: json['micropermission'] as bool? ?? false,
  settings: json['settings'] == null
      ? const UserSettings()
      : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
  stats: json['stats'] == null
      ? const UserStats()
      : UserStats.fromJson(json['stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'displayName': instance.displayName,
  'photoUrl': instance.photoUrl,
  'createdAt': const TimestampDateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampDateTimeConverter().toJson(instance.updatedAt),
  'micropermission': instance.micropermission,
  'settings': instance.settings,
  'stats': instance.stats,
};

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      language: json['language'] as String? ?? 'en',
      soundEnabled: json['soundEnabled'] as bool? ?? true,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      darkMode: json['darkMode'] as bool? ?? false,
      sessionReminderMinutes:
          (json['sessionReminderMinutes'] as num?)?.toInt() ?? 30,
      preferredDifficulty:
          $enumDecodeNullable(
            _$UserDifficultyEnumMap,
            json['preferredDifficulty'],
          ) ??
          UserDifficulty.medium,
    );

Map<String, dynamic> _$UserSettingsToJson(
  _UserSettings instance,
) => <String, dynamic>{
  'language': instance.language,
  'soundEnabled': instance.soundEnabled,
  'notificationsEnabled': instance.notificationsEnabled,
  'darkMode': instance.darkMode,
  'sessionReminderMinutes': instance.sessionReminderMinutes,
  'preferredDifficulty': _$UserDifficultyEnumMap[instance.preferredDifficulty]!,
};

const _$UserDifficultyEnumMap = {
  UserDifficulty.easy: 'easy',
  UserDifficulty.medium: 'medium',
  UserDifficulty.hard: 'hard',
};

_UserStats _$UserStatsFromJson(Map<String, dynamic> json) => _UserStats(
  totalXp: (json['totalXp'] as num?)?.toInt() ?? 0,
  currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
  longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
  totalSessions: (json['totalSessions'] as num?)?.toInt() ?? 0,
  totalNotesCreated: (json['totalNotesCreated'] as num?)?.toInt() ?? 0,
  totalExosAnswered: (json['totalExosAnswered'] as num?)?.toInt() ?? 0,
  totalCorrectAnswers: (json['totalCorrectAnswers'] as num?)?.toInt() ?? 0,
  averageAccuracy: (json['averageAccuracy'] as num?)?.toDouble() ?? 0.0,
  lastActivityAt: const NullableTimestampDateTimeConverter().fromJson(
    json['lastActivityAt'],
  ),
);

Map<String, dynamic> _$UserStatsToJson(_UserStats instance) =>
    <String, dynamic>{
      'totalXp': instance.totalXp,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'totalSessions': instance.totalSessions,
      'totalNotesCreated': instance.totalNotesCreated,
      'totalExosAnswered': instance.totalExosAnswered,
      'totalCorrectAnswers': instance.totalCorrectAnswers,
      'averageAccuracy': instance.averageAccuracy,
      'lastActivityAt': const NullableTimestampDateTimeConverter().toJson(
        instance.lastActivityAt,
      ),
    };
