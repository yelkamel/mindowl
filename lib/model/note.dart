import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
sealed class Note with _$Note {
  const factory Note({
    required String id,
    @Default('') String title,
    @Default('') String summary,
    @TimestampDateTimeConverter() required DateTime createdAt,
    @TimestampDateTimeConverter() required DateTime updatedAt,
    @NullableTimestampDateTimeConverter() DateTime? lastReviewed,
    required List<String> topics,
    required String primaryTheme,
    @Default(false) bool isFavorite,
    required String markdownContent,
    @Default(<String>[]) List<String> relatedNoteIds,
    @Default(<String>[]) List<String> sessionIds,
    @Default(<String>[]) List<String> exoIds,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  const Note._();

  int get totalExos => exoIds.length;
  int get totalSessions => sessionIds.length;

  String get themeColor {
    switch (primaryTheme.toLowerCase()) {
      case 'finance':
        return '#4CAF50';
      case 'history':
        return '#9C27B0';
      case 'geography':
        return '#2196F3';
      case 'science':
        return '#FF9800';
      case 'psychology':
        return '#E91E63';
      default:
        return '#607D8B';
    }
  }

  String get themeEmoji {
    switch (primaryTheme.toLowerCase()) {
      case 'finance':
        return '💰';
      case 'history':
        return '🏛️';
      case 'geography':
        return '🌍';
      case 'science':
        return '🔬';
      case 'psychology':
        return '🧠';
      default:
        return '📚';
    }
  }

  String get formattedCreatedDate {
    final now = DateTime.now();
    final difference = now.difference(createdAt).inDays;
    if (difference == 0) return 'Today';
    if (difference == 1) return '1 day ago';
    return '$difference days ago';
  }
}
