import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_theme.freezed.dart';
part 'task_theme.g.dart';

@freezed
sealed class TaskTheme with _$TaskTheme {
  const factory TaskTheme({
    required String id,
    required String name,
    required String color,
    required String emoji,
    @Default(false) bool isSelected,
  }) = _TaskTheme;

  factory TaskTheme.fromJson(Map<String, dynamic> json) =>
      _$TaskThemeFromJson(json);
}

// Default task themes
const List<TaskTheme> defaultTaskTheme = [
  TaskTheme(id: 'finance', name: 'Finance', color: '#4CAF50', emoji: '💰'),
  TaskTheme(id: 'history', name: 'History', color: '#9C27B0', emoji: '🏛️'),
  TaskTheme(id: 'geography', name: 'Geography', color: '#2196F3', emoji: '🌍'),
  TaskTheme(id: 'science', name: 'Science', color: '#FF9800', emoji: '🔬'),
  TaskTheme(
    id: 'psychology',
    name: 'Psychology',
    color: '#E91E63',
    emoji: '🧠',
  ),
];
