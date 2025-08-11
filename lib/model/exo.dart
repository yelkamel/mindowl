import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'exo.freezed.dart';
part 'exo.g.dart';

@freezed
sealed class Exo with _$Exo {
  const factory Exo({
    required String id,
    required String noteId,
    String? sessionId,
    required ExoType type,
    required ExoContent content,
    @Default(1) int difficulty,
    @Default(<String>[]) List<String> tags,
    @TimestampDateTimeConverter() required DateTime createdAt,
    // Legacy fields for backward compatibility
    String? question,
    @Default(<String>[]) List<String> options,
    dynamic correctAnswer,
    int? xpReward,
    String? explanation,
    @NullableTimestampDateTimeConverter() DateTime? lastAttempted,
    @Default(0) int correctAttempts,
    @Default(0) int totalAttempts,
    @Default(false) bool isAnswered,
    dynamic userAnswer,
    @Default(false) bool isCorrect,
    @Default(false) bool isFavorite,
  }) = _Exo;

  factory Exo.fromJson(Map<String, dynamic> json) => _$ExoFromJson(json);

  const Exo._();

  double get successRate =>
      totalAttempts > 0 ? correctAttempts / totalAttempts : 0.0;
  bool get isMastered => successRate >= 0.8 && totalAttempts >= 2;
  String get difficultyStars => '⭐' * difficulty;

  String get statusText {
    if (!isAnswered) return 'Not Attempted';
    if (isMastered) return 'Mastered';
    if (successRate >= 0.5) return 'Good Progress';
    return 'Needs Practice';
  }
}

@freezed
sealed class ExoContent with _$ExoContent {
  const factory ExoContent({
    required String question,
    List<String>? options,
    required dynamic answer,
    String? explanation,
  }) = _ExoContent;

  factory ExoContent.fromJson(Map<String, dynamic> json) => _$ExoContentFromJson(json);
}

enum ExoType { mcq, truefalse, cloze, ordering, short }
