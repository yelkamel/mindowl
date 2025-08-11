import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimestampDateTimeConverter implements JsonConverter<DateTime, Object?> {
  const TimestampDateTimeConverter();

  @override
  DateTime fromJson(Object? json) {
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json);
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
    if (json is String) return DateTime.parse(json);
    throw const FormatException('Invalid date format for DateTime?');
  }

  @override
  Object? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
}
