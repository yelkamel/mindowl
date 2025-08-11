import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
sealed class Session with _$Session {
  const factory Session({
    required String id,
    required String noteId,
    required String title,
    required SessionType type,
    @Default(SessionStatus.idle) SessionStatus status,
    @TimestampDateTimeConverter() required DateTime createdAt,
    @NullableTimestampDateTimeConverter() DateTime? startedAt,
    @NullableTimestampDateTimeConverter() DateTime? endedAt,
    @NullableTimestampDateTimeConverter() DateTime? lastSeenExoCreatedAt,
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
    // Legacy fields for backward compatibility
    String? source, // podcast, video, audio
    String? platform, // spotify, youtube, etc.
    @TimestampDateTimeConverter() DateTime? date,
    int? duration, // seconds
    double? liveScore,
    String? context,
    @Default(<String>[]) List<String> exoIds,
    // Quiz-specific attributes
    @NullableTimestampDateTimeConverter() DateTime? completedAt,
    int? totalQuestions,
    int? currentQuestionIndex,
    double? finalScore,
    int? correctAnswers,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  const Session._();

  String get formattedDuration {
    final minutes = duration != null ? duration! ~/ 60 : 0;
    return '${minutes}min';
  }

  String get formattedDate {
    final targetDate = date ?? createdAt;
    final now = DateTime.now();
    final difference = now.difference(targetDate).inDays;
    if (difference == 0) return 'Today';
    if (difference == 1) return '1 day ago';
    return '$difference days ago';
  }

  // Quiz-specific getters
  bool get isCompleted => status == SessionStatus.ended;
  double get progress => totalQuestions != null && totalQuestions! > 0
      ? (currentQuestionIndex ?? 0) / totalQuestions!
      : 0.0;

  String get formattedScore {
    if (finalScore == null) return 'Not completed';
    return '${(finalScore! * 100).round()}%';
  }
}

enum SessionStatus { idle, running, paused, ended }

enum SessionType { listening, quiz }
