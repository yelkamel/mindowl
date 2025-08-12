import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/model/attempt.dart';

part 'exo_screen_state.freezed.dart';

@freezed
sealed class ExoScreenState with _$ExoScreenState {
  const factory ExoScreenState({
    SessionExo? currentSessionExo,
    Exo? currentExo,
    @Default([]) List<Attempt> attempts,
    dynamic selectedAnswer,
    @Default(false) bool isAnswered,
    @Default(false) bool isCorrect,
    @Default(false) bool isLoading,
    String? error,
    @Default(0) int timeStarted,
  }) = _ExoScreenState;

  const ExoScreenState._();

  int get timeToAnswer => DateTime.now().millisecondsSinceEpoch - timeStarted;
  bool get hasSelectedAnswer => selectedAnswer != null;
  String get questionText => currentExo?.content.question ?? '';
  List<String> get options => currentExo?.content.options ?? [];
  String? get explanation => currentExo?.content.explanation;
}