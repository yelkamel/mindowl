import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';

part 'transcript.freezed.dart';
part 'transcript.g.dart';

@freezed
sealed class Transcript with _$Transcript {
  const factory Transcript({
    required String id,
    required String sessionId,
    required double startSec,
    required double endSec,
    required String text,
    @Default(false) bool processed,
    @TimestampDateTimeConverter() required DateTime createdAt,
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
  }) = _Transcript;

  factory Transcript.fromJson(Map<String, dynamic> json) =>
      _$TranscriptFromJson(json);

  const Transcript._();

  double get duration => endSec - startSec;

  String get formattedTimeRange {
    final startMin = (startSec ~/ 60);
    final startSecondes = (this.startSec % 60).toInt();
    final endMin = (endSec ~/ 60);
    final endSecond = (this.endSec % 60).toInt();

    return '${startMin.toString().padLeft(2, '0')}:${startSecondes.toString().padLeft(2, '0')} - ${endMin.toString().padLeft(2, '0')}:${endSecond.toString().padLeft(2, '0')}';
  }
}
