import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mindowl/presentation/provider/note_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:mindowl/model/note.dart';
import 'knowledge_vault_screen_state.dart';

part 'knowledge_vault_screen_notifier.g.dart';

@riverpod
class KnowledgeVaultScreenNotifier extends _$KnowledgeVaultScreenNotifier {
  Timer? _debounceTimer;

  @override
  KnowledgeVaultScreenState build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    return const KnowledgeVaultScreenState();
  }

  Future<void> loadAllNotes() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final notes = await ref.read(getAllUserNotesProvider.future);
      state = state.copyWith(
        allNotes: notes,
        filteredNotes: notes,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void searchNotes(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      state = state.copyWith(searchQuery: query);
      _applyFilters();
    });
  }

  void filterByTheme(String? theme) {
    state = state.copyWith(selectedTheme: theme);
    _applyFilters();
  }

  void toggleFavoritesOnly() {
    state = state.copyWith(showFavoritesOnly: !state.showFavoritesOnly);
    _applyFilters();
  }

  void clearAllFilters() {
    state = state.copyWith(
      searchQuery: '',
      selectedTheme: null,
      showFavoritesOnly: false,
    );
    _applyFilters();
  }

  void _applyFilters() {
    List<Note> filtered = List.from(state.allNotes);

    // Apply search filter
    if (state.hasSearchQuery) {
      final query = state.searchQuery.toLowerCase();
      filtered = filtered.where((note) {
        return note.title.toLowerCase().contains(query) ||
            (note.summary?.toLowerCase().contains(query) ?? false) ||
            note.topics.any((topic) => topic.toLowerCase().contains(query)) ||
            note.markdownContent.toLowerCase().contains(query);
      }).toList();
    }

    // Apply theme filter
    if (state.hasThemeFilter) {
      filtered = filtered
          .where((note) => note.primaryTheme == state.selectedTheme)
          .toList();
    }

    // Apply favorites filter
    if (state.showFavoritesOnly) {
      filtered = filtered.where((note) => note.isFavorite).toList();
    }

    // Sort by most recently updated
    filtered.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    state = state.copyWith(filteredNotes: filtered);
  }

  void navigateToNote(BuildContext context, Note note) {
    context.push('/note/${note.id}');
  }

  void navigateToNoteDetail(BuildContext context, String noteId) {
    context.push('/note-detail/$noteId');
  }

  Future<void> toggleNoteFavorite(String noteId) async {
    final noteIndex = state.allNotes.indexWhere((note) => note.id == noteId);
    if (noteIndex == -1) return;

    final note = state.allNotes[noteIndex];
    final updatedNote = note.copyWith(
      isFavorite: !note.isFavorite,
      updatedAt: DateTime.now(),
    );

    // Update local state
    final updatedAllNotes = List<Note>.from(state.allNotes);
    updatedAllNotes[noteIndex] = updatedNote;

    state = state.copyWith(allNotes: updatedAllNotes);
    _applyFilters();

    // TODO: Implement actual note update use case
    // await _noteProvider!.updateNote(updatedNote);
  }

  void refreshNotes() {
    loadAllNotes();
  }

  void sortBy(String sortType) {
    List<Note> sorted = List.from(state.filteredNotes);

    switch (sortType) {
      case 'title':
        sorted.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'created':
        sorted.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'updated':
        sorted.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        break;
      case 'exos':
        sorted.sort((a, b) => b.totalExos.compareTo(a.totalExos));
        break;
      case 'sessions':
        sorted.sort((a, b) => b.totalSessions.compareTo(a.totalSessions));
        break;
    }

    state = state.copyWith(filteredNotes: sorted);
  }
}
