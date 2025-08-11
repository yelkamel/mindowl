import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/data/fake_data.dart';
import '../molecule/vault_header.dart';
import '../molecule/search_filters.dart';
import '../molecule/note_card.dart';
import '../molecule/empty_state.dart';

class VaultContent extends StatefulWidget {
  const VaultContent({super.key});

  @override
  State<VaultContent> createState() => _VaultContentState();
}

class _VaultContentState extends State<VaultContent>
    with TickerProviderStateMixin {
  late AnimationController _searchController;
  late Animation<double> _searchAnimation;

  final TextEditingController _searchTextController = TextEditingController();
  String _selectedFilter = 'All';
  String _sortBy = 'Recent';
  bool _isSearchExpanded = false;

  List<Note> get _studyNotes => FakeData.notes;

  @override
  void initState() {
    super.initState();

    _searchController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _searchAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _searchController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearchExpanded = !_isSearchExpanded;
      if (_isSearchExpanded) {
        _searchController.forward();
      } else {
        _searchController.reverse();
        _searchTextController.clear();
      }
    });
  }

  void _handleSearchChanged() {
    setState(() {});
  }

  void _handleFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  void _handleSortChanged(String sortBy) {
    setState(() {
      _sortBy = sortBy;
    });
  }

  List<Note> get _filteredNotes {
    var notes = List<Note>.from(_studyNotes);

    // Apply search filter
    if (_searchTextController.text.isNotEmpty) {
      notes = notes.where((note) =>
        note.title.toLowerCase().contains(_searchTextController.text.toLowerCase()) ||
        note.topics.any((topic) => topic.toLowerCase().contains(_searchTextController.text.toLowerCase()))
      ).toList();
    }

    // Apply category filter
    switch (_selectedFilter) {
      case 'Favorites':
        notes = notes.where((note) => note.isFavorite).toList();
        break;
      case 'Need Review':
        notes = notes.where((note) => _calculateAverageScore(note) < 0.8).toList();
        break;
      case 'Mastered':
        notes = notes.where((note) => _calculateAverageScore(note) >= 0.85).toList();
        break;
    }

    // Apply sorting
    switch (_sortBy) {
      case 'Recent':
        notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'Score':
        notes.sort((a, b) => _calculateAverageScore(b).compareTo(_calculateAverageScore(a)));
        break;
      case 'Title':
        notes.sort((a, b) => a.title.compareTo(b.title));
        break;
    }

    return notes;
  }

  double _calculateAverageScore(Note note) {
    final exos = FakeData.getExosForNote(note.id);
    if (exos.isEmpty) return 0.0;

    final answered = exos.where((e) => e.isAnswered);
    if (answered.isEmpty) return 0.0;

    final correctCount = answered.where((e) => e.isCorrect).length;
    return correctCount / answered.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VaultHeader(
          totalNotes: _studyNotes.length,
          isSearchExpanded: _isSearchExpanded,
          onSearchToggle: _toggleSearch,
        ),
        SearchFilters(
          searchController: _searchTextController,
          searchAnimation: _searchAnimation,
          selectedFilter: _selectedFilter,
          sortBy: _sortBy,
          onFilterChanged: _handleFilterChanged,
          onSortChanged: _handleSortChanged,
          onSearchChanged: _handleSearchChanged,
        ),
        Expanded(
          child: _filteredNotes.isEmpty
              ? const EmptyState()
              : _buildNotesList(),
        ),
      ],
    );
  }

  Widget _buildNotesList() {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: _filteredNotes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return NoteCard(note: _filteredNotes[index]);
      },
    );
  }
}