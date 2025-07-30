import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../models/note.dart';
import '../models/exo.dart';
import '../models/session.dart';
import '../models/quiz.dart';
import '../data/fake_data.dart';

class NoteDetailScreen extends StatefulWidget {
  final String noteId;

  const NoteDetailScreen({Key? key, required this.noteId}) : super(key: key);

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late Note note;
  List<Session> sessions = [];
  List<Exo> exos = [];
  List<Quiz> quizzes = [];
  ExoSortType sortType = ExoSortType.byCompletion;

  @override
  void initState() {
    super.initState();
    _loadNoteData();
  }

  void _loadNoteData() {
    note = FakeData.getNoteById(widget.noteId)!;
    sessions = FakeData.getSessionsForNote(widget.noteId);
    exos = FakeData.getExosForNote(widget.noteId);
    quizzes = FakeData.getQuizzesForNote(widget.noteId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          _buildHeader(),
          _buildSessionDetails(),
          _buildThemeClassification(),
          _buildMarkdownContent(),
          _buildExoCollection(),
          _buildActionsFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final completedExos = exos.where((e) => e.isMastered).length;
    final completionProgress = exos.isNotEmpty
        ? completedExos / exos.length
        : 0.0;

    return SliverAppBar(
      expandedHeight: 180,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '${note.themeEmoji} ${note.primaryTheme}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${exos.length} Exos',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        children: [
                          _buildModernCompletionRing(completionProgress),
                          const SizedBox(height: 4),
                          Text(
                            'Progress',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            note.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
          ),
          onPressed: () {
            // Toggle favorite
          },
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          iconSize: 24,
          onSelected: (value) {
            switch (value) {
              case 'share':
                // Share note
                break;
              case 'export':
                // Export markdown
                break;
              case 'duplicate':
                // Duplicate note
                break;
              case 'delete':
                // Delete note
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'share', child: Text('Share Note')),
            const PopupMenuItem(
              value: 'export',
              child: Text('Export Markdown'),
            ),
            const PopupMenuItem(value: 'duplicate', child: Text('Duplicate')),
            const PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
        ),
      ],
    );
  }

  Widget _buildModernCompletionRing(double progress) {
    return Container(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Positioned.fill(
            child: CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
              strokeWidth: 4,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(progress * 100).round()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletionRing(double progress) {
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 3,
          ),
          Center(
            child: Text(
              '${(progress * 100).round()}%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionDetails() {
    if (sessions.isEmpty)
      return const SliverToBoxAdapter(child: SizedBox.shrink());

    final latestSession = sessions.first;

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.history, color: Colors.grey[600], size: 16),
                const SizedBox(width: 8),
                Text(
                  'Latest Session',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildSessionStat(
                    'Duration',
                    latestSession.formattedDuration,
                  ),
                ),
                Expanded(
                  child: _buildSessionStat(
                    'Score',
                    '${(latestSession.liveScore * 100).round()}%',
                  ),
                ),
                Expanded(
                  child: _buildSessionStat('Platform', latestSession.platform),
                ),
                Expanded(
                  child: _buildSessionStat('Date', latestSession.formattedDate),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              latestSession.context,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildThemeClassification() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildThemeChip(note.primaryTheme, isPrimary: true),
                const SizedBox(width: 8),
                ...note.topics
                    .take(2)
                    .map(
                      (topic) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _buildThemeChip(topic, isPrimary: false),
                      ),
                    ),
              ],
            ),
            const SizedBox(width: 12),
            if (note.relatedNoteIds.isNotEmpty)
              TextButton.icon(
                onPressed: () {
                  // Navigate to related notes
                },
                icon: const Icon(Icons.link, size: 16),
                label: Text('${note.relatedNoteIds.length} related notes'),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.zero,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeChip(String theme, {required bool isPrimary}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPrimary
            ? Theme.of(context).colorScheme.primary
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isPrimary ? '${note.themeEmoji} $theme' : theme,
        style: TextStyle(
          color: isPrimary ? Colors.white : Colors.grey[700],
          fontSize: 12,
          fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildMarkdownContent() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.article_outlined, color: Colors.grey[600], size: 20),
                const SizedBox(width: 8),
                Text(
                  'Study Notes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            MarkdownBody(
              data: note.markdownContent,
              styleSheet: MarkdownStyleSheet(
                h1: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                h2: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                h3: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                p: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
                blockquote: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
                blockquoteDecoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withOpacity(0.1),
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 4,
                    ),
                  ),
                ),
                listBullet: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExoCollection() {
    final sortedExos = _getSortedExos();

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildExoHeader(),
            _buildExoSortOptions(),
            ...sortedExos.map((exo) => _buildExoCard(exo)),
          ],
        ),
      ),
    );
  }

  Widget _buildExoHeader() {
    final completedExos = exos.where((e) => e.isMastered).length;
    final progress = exos.isNotEmpty ? completedExos / exos.length : 0.0;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(Icons.quiz_outlined, color: Colors.grey[600], size: 20),
          const SizedBox(width: 8),
          Text(
            'All Exos (${exos.length})',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${(progress * 100).round()}% Complete',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExoSortOptions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'Sort by:',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(width: 12),
          _buildSortChip('Completion', ExoSortType.byCompletion),
          const SizedBox(width: 8),
          _buildSortChip('Difficulty', ExoSortType.byDifficulty),
          const SizedBox(width: 8),
          _buildSortChip('Recent', ExoSortType.byRecent),
        ],
      ),
    );
  }

  Widget _buildSortChip(String label, ExoSortType type) {
    final isSelected = sortType == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          sortType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildExoCard(Exo exo) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  exo.question,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _buildExoStatusIcon(exo),
            ],
          ),
          if (exo.type == ExoType.multipleChoice) ...[
            const SizedBox(height: 12),
            ...exo.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isCorrect = index == exo.correctAnswer;
              final isUserAnswer = exo.userAnswer == index;

              return Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isCorrect
                      ? Theme.of(context).colorScheme.tertiary.withOpacity(0.1)
                      : isUserAnswer && !isCorrect
                      ? Theme.of(context).colorScheme.error.withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isCorrect
                        ? Theme.of(
                            context,
                          ).colorScheme.tertiary.withOpacity(0.5)
                        : isUserAnswer && !isCorrect
                        ? Theme.of(context).colorScheme.error.withOpacity(0.3)
                        : Colors.grey[300]!,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '${String.fromCharCode(65 + index)}) $option',
                      style: TextStyle(
                        fontSize: 13,
                        color: isCorrect
                            ? Theme.of(context).colorScheme.tertiary
                            : isUserAnswer && !isCorrect
                            ? Theme.of(
                                context,
                              ).colorScheme.error.withOpacity(0.7)
                            : Colors.grey[700],
                      ),
                    ),
                    const Spacer(),
                    if (isCorrect)
                      Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 16,
                      ),
                    if (isUserAnswer && !isCorrect)
                      Icon(
                        Icons.close,
                        color: Theme.of(
                          context,
                        ).colorScheme.error.withOpacity(0.7),
                        size: 16,
                      ),
                  ],
                ),
              );
            }),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              _buildExoMetadata(
                exo.difficultyStars,
                Icons.star,
                Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 16),
              _buildExoMetadata(
                exo.statusText,
                Icons.trending_up,
                exo.isMastered
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.secondary,
              ),
              const Spacer(),
              if (exo.lastAttempted != null)
                Text(
                  exo.lastAttempted!.difference(DateTime.now()).inDays.abs() ==
                          0
                      ? 'Today'
                      : '${exo.lastAttempted!.difference(DateTime.now()).inDays.abs()}d ago',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to individual exo detail
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: const Text('Practice', style: TextStyle(fontSize: 12)),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  setState(() {
                    exo.isFavorite = !exo.isFavorite;
                  });
                },
                icon: Icon(
                  exo.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: exo.isFavorite
                      ? Theme.of(context).colorScheme.error
                      : Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExoStatusIcon(Exo exo) {
    if (!exo.isAnswered) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.help_outline, color: Colors.grey[600], size: 16),
      );
    }

    if (exo.isMastered) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 16),
      );
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: exo.isCorrect
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.secondary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        exo.isCorrect ? Icons.check : Icons.refresh,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  Widget _buildExoMetadata(String text, IconData icon, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 14),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionsFooter() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Start quiz with all exos
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Quiz All Exos'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Start quiz with incomplete exos only
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Quiz Incomplete'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Quiz favorites
                  },
                  icon: Icon(Icons.favorite, color: Colors.grey[600]),
                  label: Text(
                    'Favorites',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    // Mixed quiz
                  },
                  icon: Icon(Icons.shuffle, color: Colors.grey[600]),
                  label: Text(
                    'Mixed Quiz',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    // Export note
                  },
                  icon: Icon(Icons.share, color: Colors.grey[600]),
                  label: Text(
                    'Export',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  List<Exo> _getSortedExos() {
    final sortedExos = List<Exo>.from(exos);

    switch (sortType) {
      case ExoSortType.byCompletion:
        sortedExos.sort((a, b) {
          if (a.isMastered && !b.isMastered) return 1;
          if (!a.isMastered && b.isMastered) return -1;
          return b.successRate.compareTo(a.successRate);
        });
        break;
      case ExoSortType.byDifficulty:
        sortedExos.sort((a, b) => a.difficulty.compareTo(b.difficulty));
        break;
      case ExoSortType.byRecent:
        sortedExos.sort((a, b) {
          final aTime = a.lastAttempted ?? a.createdAt;
          final bTime = b.lastAttempted ?? b.createdAt;
          return bTime.compareTo(aTime);
        });
        break;
    }

    return sortedExos;
  }

  Color _hexToColor(String hex) {
    return Color(int.parse(hex.substring(1), radix: 16) + 0xFF000000);
  }
}

enum ExoSortType { byCompletion, byDifficulty, byRecent }
