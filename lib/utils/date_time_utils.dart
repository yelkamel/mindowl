import 'package:flutter/material.dart';

// Convert DateTime to JSON-compatible format
String dateTimetoJson(DateTime dateTime) {
  return dateTime.toIso8601String();
}

// Convert JSON string back to DateTime
DateTime dateTimefromJson(String json) {
  return DateTime.parse(json);
}

// Convert nullable DateTime to JSON-compatible format
String? dateTimetoJsonWithNull(DateTime? dateTime) {
  return dateTime?.toIso8601String();
}

// Convert nullable JSON string back to DateTime
DateTime? dateTimefromJsonWithNull(String? json) {
  if (json == null) return null;
  return DateTime.parse(json);
}

// Convert TimeOfDay to JSON-compatible format
String timeOfTheDaytoJson(TimeOfDay timeOfDay) {
  return '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
}

// Convert JSON string back to TimeOfDay
TimeOfDay timeOfDayFromJson(String json) {
  final parts = json.split(':');
  return TimeOfDay(
    hour: int.parse(parts[0]),
    minute: int.parse(parts[1]),
  );
}

// Convert Duration to JSON-compatible format
int durationtoJson(Duration duration) {
  return duration.inSeconds;
}

// Convert JSON integer back to Duration
Duration durationfromJson(int json) {
  return Duration(seconds: json);
}
