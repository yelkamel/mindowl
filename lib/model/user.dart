import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user.freezed.dart';
part 'user.g.dart';

class TimestampDateTimeConverter implements JsonConverter<DateTime, Object?> {
  const TimestampDateTimeConverter();

  @override
  DateTime fromJson(Object? json) {
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json); // optional fallback
    throw const FormatException('Invalid date format for DateTime');
  }

  @override
  Object toJson(DateTime date) => Timestamp.fromDate(date);
}

class NullableTimestampDateTimeConverter
    implements JsonConverter<DateTime?, Object?> {
  const NullableTimestampDateTimeConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json); // optional fallback
    throw const FormatException('Invalid date format for DateTime?');
  }

  @override
  Object? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
}

@freezed
sealed class User with _$User {
  const factory User({
    required String uid,
    required String email,
    String? displayName,
    String? photoUrl,
    @TimestampDateTimeConverter() required DateTime createdAt,
    @TimestampDateTimeConverter() required DateTime updatedAt,
    @Default(false) bool micropermission,
    @Default(UserSettings()) UserSettings settings,
    @Default(UserStats()) UserStats stats,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    @Default('en') String language,
    @Default(true) bool soundEnabled,
    @Default(true) bool notificationsEnabled,
    @Default(false) bool darkMode,
    @Default(30) int sessionReminderMinutes,
    @Default(UserDifficulty.medium) UserDifficulty preferredDifficulty,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);
}

@freezed
sealed class UserStats with _$UserStats {
  const factory UserStats({
    @Default(0) int totalXp,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0) int totalSessions,
    @Default(0) int totalNotesCreated,
    @Default(0) int totalExosAnswered,
    @Default(0) int totalCorrectAnswers,
    @Default(0.0) double averageAccuracy,
    @NullableTimestampDateTimeConverter() DateTime? lastActivityAt,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) => _$UserStatsFromJson(json);

  const UserStats._();

  double get accuracyPercentage => averageAccuracy * 100;
}

enum UserDifficulty { easy, medium, hard }
