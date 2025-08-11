import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/data/fake_data.dart';
import 'package:mindowl/presentation/screen/notedetail/note_detail_screen.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 100),
      child: Container(
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
          children: [_buildHeader(context), _buildActionButtons(context)],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final sessions = FakeData.getSessionsForNote(note.id);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getSourceColor(
                    context,
                    _getLatestSessionSource(),
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: HeroIcon(
                  _getSourceIcon(_getLatestSessionSource()),
                  size: 20,
                  color: _getSourceColor(context, _getLatestSessionSource()),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
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
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.6),
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
                          _getLatestSessionDuration(),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.6),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (note.isFavorite)
                const HeroIcon(HeroIcons.heart, size: 20, color: Colors.red),
            ],
          ),
          const SizedBox(height: 16),
          _buildTopicTags(context),
          const SizedBox(height: 16),
          _buildProgressRow(context),
        ],
      ),
    );
  }

  Widget _buildTopicTags(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: note.topics
          .map(
            (topic) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                topic,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildProgressRow(BuildContext context) {
    final completionProgress = _getCompletionProgress();
    final averageScore = _calculateAverageScore();

    return Row(
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
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    '${_getCompletedExos()}/${note.totalExos} exos',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: completionProgress,
                backgroundColor: Theme.of(context).colorScheme.outline,
                valueColor: AlwaysStoppedAnimation<Color>(
                  completionProgress == 1.0
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getMasteryColor(context, averageScore).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${(averageScore * 100).toInt()}%',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: _getMasteryColor(context, averageScore),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
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
              onPressed: () => _viewNoteDetails(context),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
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
              onPressed: () => _startQuizMode(context),
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
    );
  }

  // Helper methods
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

  Color _getSourceColor(BuildContext context, String source) {
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

  Color _getMasteryColor(BuildContext context, double score) {
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

  double _calculateAverageScore() {
    final exos = FakeData.getExosForNote(note.id);
    if (exos.isEmpty) return 0.0;

    final answered = exos.where((e) => e.isAnswered);
    if (answered.isEmpty) return 0.0;

    final correctCount = answered.where((e) => e.isCorrect).length;
    return correctCount / answered.length;
  }

  int _getCompletedExos() {
    final exos = FakeData.getExosForNote(note.id);
    return exos.where((e) => e.isMastered).length;
  }

  double _getCompletionProgress() {
    if (note.totalExos == 0) return 0.0;
    return _getCompletedExos() / note.totalExos;
  }

  String _getLatestSessionSource() {
    final sessions = FakeData.getSessionsForNote(note.id);
    if (sessions.isEmpty) return 'audio';
    return sessions.first.source ?? 'audio';
  }

  String _getLatestSessionDuration() {
    final sessions = FakeData.getSessionsForNote(note.id);
    if (sessions.isEmpty) return '0:00';
    return _formatDuration(sessions.first.duration ?? 0);
  }

  void _startQuizMode(BuildContext context) {
    final exos = FakeData.getExosForNote(note.id);
    context.push(
      '/quiz-flow',
      extra: {'noteId': note.id, 'noteTitle': note.title, 'exos': exos},
    );
  }

  void _viewNoteDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailScreen(noteId: note.id),
      ),
    );
  }
}
