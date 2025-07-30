import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import '../models/note.dart';
import '../data/fake_data.dart';
import 'note_detail_screen.dart';

class KnowledgeVaultScreen extends StatefulWidget {
  const KnowledgeVaultScreen({super.key});

  @override
  State<KnowledgeVaultScreen> createState() => _KnowledgeVaultScreenState();
}

class _KnowledgeVaultScreenState extends State<KnowledgeVaultScreen>
    with TickerProviderStateMixin {
  late AnimationController _searchController;
  late Animation<double> _searchAnimation;

  final TextEditingController _searchController_text = TextEditingController();
  String _selectedFilter = 'All';
  String _sortBy = 'Recent';
  bool _isSearchExpanded = false;

  // Use the fake data
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
    _searchController_text.dispose();
    super.dispose();
  }

  List<Note> get _filteredNotes {
    var notes = List<Note>.from(_studyNotes);

    // Apply search filter
    if (_searchController_text.text.isNotEmpty) {
      notes = notes
          .where(
            (note) =>
                note.title.toLowerCase().contains(
                  _searchController_text.text.toLowerCase(),
                ) ||
                note.topics.any(
                  (topic) => topic.toLowerCase().contains(
                    _searchController_text.text.toLowerCase(),
                  ),
                ),
          )
          .toList();
    }

    // Apply category filter
    switch (_selectedFilter) {
      case 'Favorites':
        notes = notes.where((note) => note.isFavorite).toList();
        break;
      case 'Need Review':
        notes = notes
            .where((note) => _calculateAverageScore(note) < 0.8)
            .toList();
        break;
      case 'Mastered':
        notes = notes
            .where((note) => _calculateAverageScore(note) >= 0.85)
            .toList();
        break;
    }

    // Apply sorting
    switch (_sortBy) {
      case 'Recent':
        notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'Score':
        notes.sort(
          (a, b) =>
              _calculateAverageScore(b).compareTo(_calculateAverageScore(a)),
        );
        break;
      case 'Title':
        notes.sort((a, b) => a.title.compareTo(b.title));
        break;
    }

    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),

            // Search and Filters
            _buildSearchAndFilters(),

            // Notes List
            Expanded(
              child: _filteredNotes.isEmpty
                  ? _buildEmptyState()
                  : _buildNotesList(),
            ),
          ],
        ),
      ),

      // Floating Action Button for new session
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/mode-selection'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        icon: const HeroIcon(HeroIcons.plus, size: 20),
        label: const Text(
          'New Session',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          IconButton(
            icon: const HeroIcon(HeroIcons.arrowLeft),
            onPressed: () => context.pop(),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Knowledge Vault',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                '${_studyNotes.length} study sessions',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: HeroIcon(
              _isSearchExpanded ? HeroIcons.xMark : HeroIcons.magnifyingGlass,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              setState(() {
                _isSearchExpanded = !_isSearchExpanded;
                if (_isSearchExpanded) {
                  _searchController.forward();
                } else {
                  _searchController.reverse();
                  _searchController_text.clear();
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          // Search Bar
          AnimatedBuilder(
            animation: _searchAnimation,
            builder: (context, child) {
              return SizedBox(
                height: 56 * _searchAnimation.value,
                child: Opacity(
                  opacity: _searchAnimation.value,
                  child: TextField(
                    controller: _searchController_text,
                    decoration: InputDecoration(
                      hintText: 'Search notes and topics...',
                      prefixIcon: const HeroIcon(
                        HeroIcons.magnifyingGlass,
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                ),
              );
            },
          ),

          if (_isSearchExpanded) const SizedBox(height: 16),

          // Filter Chips
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip('All'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Favorites'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Need Review'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Mastered'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              PopupMenuButton<String>(
                icon: HeroIcon(
                  HeroIcons.adjustmentsHorizontal,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onSelected: (value) => setState(() => _sortBy = value),
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'Recent', child: Text('Recent')),
                  const PopupMenuItem(value: 'Score', child: Text('Score')),
                  const PopupMenuItem(value: 'Title', child: Text('Title')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildNotesList() {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: _filteredNotes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _buildNoteCard(_filteredNotes[index]);
      },
    );
  }

  Widget _buildNoteCard(Note note) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Source Icon
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _getSourceColor(
                            _getLatestSessionSource(note),
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: HeroIcon(
                          _getSourceIcon(_getLatestSessionSource(note)),
                          size: 20,
                          color: _getSourceColor(_getLatestSessionSource(note)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  _formatDate(note.createdAt),
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.6),
                                      ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '•',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _getLatestSessionDuration(note),
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.6),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (note.isFavorite)
                        const HeroIcon(
                          HeroIcons.heart,
                          size: 20,
                          color: Colors.red,
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Topic Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: note.topics
                        .map(
                          (topic) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              topic,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 16),

                  // Progress and Stats
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Progress',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.6),
                                      ),
                                ),
                                Text(
                                  '${_getCompletedExos(note)}/${note.totalExos} exos',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            LinearProgressIndicator(
                              value: _getCompletionProgress(note),
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.outline,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _getCompletionProgress(note) == 1.0
                                    ? Theme.of(context).colorScheme.tertiary
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getMasteryColor(
                            _calculateAverageScore(note),
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${(_calculateAverageScore(note) * 100).toInt()}%',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: _getMasteryColor(
                                  _calculateAverageScore(note),
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Action Buttons
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _viewNoteDetails(note),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      icon: HeroIcon(
                        HeroIcons.bookOpen,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(
                        'Read Note',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _startQuizMode(note),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        foregroundColor: Theme.of(context).colorScheme.onSecondary,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      icon: const HeroIcon(HeroIcons.playCircle, size: 18),
                      label: const Text(
                        'Start Quiz',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: HeroIcon(
              HeroIcons.bookOpen,
              size: 60,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Your Knowledge Vault is Empty',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete your first learning session to start\ncollecting valuable knowledge',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => context.push('/mode-selection'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            icon: const HeroIcon(HeroIcons.plus, size: 20),
            label: const Text(
              'Start Learning',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Methods
  HeroIcons _getSourceIcon(String source) {
    switch (source) {
      case 'podcast':
        return HeroIcons.speakerWave;
      case 'video':
        return HeroIcons.videoCamera;
      case 'audio':
        return HeroIcons.musicalNote;
      default:
        return HeroIcons.documentText;
    }
  }

  Color _getSourceColor(String source) {
    switch (source) {
      case 'podcast':
        return Theme.of(context).colorScheme.secondary;
      case 'video':
        return Theme.of(context).colorScheme.tertiary;
      case 'audio':
        return Theme.of(context).colorScheme.primary;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  Color _getMasteryColor(double score) {
    if (score >= 0.85) return Theme.of(context).colorScheme.tertiary;
    if (score >= 0.7) return Theme.of(context).colorScheme.secondary;
    return Theme.of(context).colorScheme.secondary;
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) return 'Today';
    if (difference == 1) return 'Yesterday';
    if (difference < 7) return '$difference days ago';
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _startQuizMode(Note note) {
    final exos = FakeData.getExosForNote(note.id);
    context.push(
      '/quiz-flow',
      extra: {'noteId': note.id, 'noteTitle': note.title, 'exos': exos},
    );
  }

  void _viewNoteDetails(Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailScreen(noteId: note.id),
      ),
    );
  }

  // Helper methods for the new data structure
  double _calculateAverageScore(Note note) {
    final exos = FakeData.getExosForNote(note.id);
    if (exos.isEmpty) return 0.0;

    final answered = exos.where((e) => e.isAnswered);
    if (answered.isEmpty) return 0.0;

    final correctCount = answered.where((e) => e.isCorrect).length;
    return correctCount / answered.length;
  }

  int _getCompletedExos(Note note) {
    final exos = FakeData.getExosForNote(note.id);
    return exos.where((e) => e.isMastered).length;
  }

  double _getCompletionProgress(Note note) {
    if (note.totalExos == 0) return 0.0;
    return _getCompletedExos(note) / note.totalExos;
  }

  String _getLatestSessionSource(Note note) {
    final sessions = FakeData.getSessionsForNote(note.id);
    if (sessions.isEmpty) return 'audio';
    return sessions.first.source;
  }

  String _getLatestSessionDuration(Note note) {
    final sessions = FakeData.getSessionsForNote(note.id);
    if (sessions.isEmpty) return '0:00';
    return _formatDuration(sessions.first.duration);
  }
}
