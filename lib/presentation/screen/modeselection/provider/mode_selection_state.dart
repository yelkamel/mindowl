import 'package:freezed_annotation/freezed_annotation.dart';

part 'mode_selection_state.freezed.dart';

@freezed
sealed class ModeSelectionState with _$ModeSelectionState {
  const factory ModeSelectionState({
    @Default(null) int? selectedMode, // 0 for solo, 1 for group
    @Default(false) bool isCreatingSession,
    String? error,
  }) = _ModeSelectionState;

  const ModeSelectionState._();

  bool get isSoloSelected => selectedMode == 0;
  bool get isGroupSelected => selectedMode == 1;
  bool get hasSelection => selectedMode != null;
}