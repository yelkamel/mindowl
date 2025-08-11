import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/model/session.dart';

part 'home_data.freezed.dart';

@freezed
sealed class HomeData with _$HomeData {
  const factory HomeData({
    required int currentStreak,
    required int currentLevel,
    required int currentXP,
    required int maxXP,
    required int todaySessions,
    required int totalXP,
    required double accuracy,
    required List<Note> recentNotes,
    required List<Session> recentSessions,
  }) = _HomeData;

  const HomeData._();

  double get progressPercentage => currentXP / maxXP;
  int get progressPercent => ((currentXP / maxXP) * 100).toInt();
  int get accuracyPercent => (accuracy * 100).toInt();
}
