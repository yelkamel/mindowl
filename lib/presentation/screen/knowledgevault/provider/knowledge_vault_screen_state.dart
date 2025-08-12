import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindowl/model/note.dart';

part 'knowledge_vault_screen_state.freezed.dart';

@freezed
sealed class KnowledgeVaultScreenState with _$KnowledgeVaultScreenState {
  const factory KnowledgeVaultScreenState({
    @Default([]) List<Note> allNotes,
    @Default([]) List<Note> filteredNotes,
    @Default('') String searchQuery,
    String? selectedTheme,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool showFavoritesOnly,
  }) = _KnowledgeVaultScreenState;

  const KnowledgeVaultScreenState._();

  int get totalNotes => allNotes.length;
  int get filteredNotesCount => filteredNotes.length;
  bool get hasSearchQuery => searchQuery.isNotEmpty;
  bool get hasThemeFilter => selectedTheme != null;
  bool get hasActiveFilters => hasSearchQuery || hasThemeFilter || showFavoritesOnly;
  List<String> get availableThemes => allNotes.map((note) => note.primaryTheme).toSet().toList()..sort();
}