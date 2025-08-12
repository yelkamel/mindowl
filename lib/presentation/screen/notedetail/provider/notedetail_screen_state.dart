import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/model/session.dart';

part 'notedetail_screen_state.freezed.dart';

@freezed
sealed class NoteDetailScreenState with _$NoteDetailScreenState {
  const factory NoteDetailScreenState({
    Note? currentNote,
    @Default([]) List<Exo> noteExos,
    @Default([]) List<Session> noteSessions,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool showAllExos,
    @Default(false) bool showAllSessions,
  }) = _NoteDetailScreenState;

  const NoteDetailScreenState._();

  int get totalExos => noteExos.length;
  int get totalSessions => noteSessions.length;
  List<Exo> get displayedExos => showAllExos ? noteExos : noteExos.take(5).toList();
  List<Session> get displayedSessions => showAllSessions ? noteSessions : noteSessions.take(3).toList();
  bool get hasMoreExos => noteExos.length > 5;
  bool get hasMoreSessions => noteSessions.length > 3;
}