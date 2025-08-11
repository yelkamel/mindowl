// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskTheme _$TaskThemeFromJson(Map<String, dynamic> json) => _TaskTheme(
  id: json['id'] as String,
  name: json['name'] as String,
  color: json['color'] as String,
  emoji: json['emoji'] as String,
  isSelected: json['isSelected'] as bool? ?? false,
);

Map<String, dynamic> _$TaskThemeToJson(_TaskTheme instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'emoji': instance.emoji,
      'isSelected': instance.isSelected,
    };
