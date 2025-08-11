import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters.dart';
import 'exo.dart';

part 'session_exo.freezed.dart';
part 'session_exo.g.dart';

@freezed
sealed class SessionExo with _$SessionExo {
  const factory SessionExo({
    required String id,
    required String sessionId,
    required String noteId,
    required String exoId,
    @TimestampDateTimeConverter() required DateTime spawnedAt,
    @Default(SessionExoStatus.pending) SessionExoStatus status,
    ExoContent? snapshotLite, // Optional offline snapshot
    @Default(<String, dynamic>{}) Map<String, dynamic> metadata,
  }) = _SessionExo;

  factory SessionExo.fromJson(Map<String, dynamic> json) => _$SessionExoFromJson(json);

  const SessionExo._();

  bool get isPending => status == SessionExoStatus.pending;
  bool get isAnswered => status == SessionExoStatus.answered;
  bool get isSkipped => status == SessionExoStatus.skipped;
  
  String get statusText {
    switch (status) {
      case SessionExoStatus.pending:
        return 'Pending';
      case SessionExoStatus.answered:
        return 'Answered';
      case SessionExoStatus.skipped:
        return 'Skipped';
    }
  }
}

enum SessionExoStatus { pending, answered, skipped }