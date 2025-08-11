import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/data/fake_data.dart';

class NotesPreview extends StatelessWidget {
  final int notesSaved;

  const NotesPreview({super.key, required this.notesSaved});

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildFilterChips(context),
          const SizedBox(height: 16),
          ..._buildNoteCards(context),
          const SizedBox(height: 16),
          _buildViewAllButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        HeroIcon(
          HeroIcons.bookOpen,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Text(
          'Your Study Notes',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        Text(
          '$notesSaved total',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    return Row(
      children: [
        _buildFilterChip(context, 'Recent', true),
        const SizedBox(width: 8),
        _buildFilterChip(context, 'Favorites', false),
        const SizedBox(width: 8),
        _buildFilterChip(context, 'Topics', false),
      ],
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
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
    );
  }

  List<Widget> _buildNoteCards(BuildContext context) {
    return List.generate(
      3,
      (index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _buildNoteCard(context, index),
      ),
    );
  }

  Widget _buildNoteCard(BuildContext context, int index) {
    final notes = FakeData.notes.take(3).toList();
    if (index >= notes.length) return const SizedBox.shrink();

    final note = notes[index];
    final exos = FakeData.getExosForNote(note.id);
    final sessions = FakeData.getSessionsForNote(note.id);

    final answeredExos = exos.where((e) => e.isAnswered);
    final averageScore = answeredExos.isEmpty
        ? 0.0
        : answeredExos.where((e) => e.isCorrect).length / answeredExos.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HeroIcon(
                _getSourceIcon(
                  sessions.isNotEmpty
                      ? sessions.first.source ?? 'audio'
                      : 'audio',
                ),
                size: 16,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  note.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: averageScore >= 0.85
                      ? Colors.green.withOpacity(0.1)
                      : Theme.of(
                          context,
                        ).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${(averageScore * 100).toInt()}%',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: averageScore >= 0.85
                        ? Colors.green
                        : Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Contains ${exos.length} questions • Reviewed ${_formatDateAgo(note.lastReviewed ?? note.createdAt)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _viewNoteDetails(context, note),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  icon: HeroIcon(
                    HeroIcons.bookOpen,
                    size: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'Read Note',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _startQuizMode(context, note),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 0,
                  ),
                  icon: const HeroIcon(HeroIcons.playCircle, size: 14),
                  label: const Text(
                    'Start Quiz',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton.icon(
        onPressed: () => context.push('/knowledge-vault'),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: HeroIcon(
          HeroIcons.arrowRight,
          size: 16,
          color: Theme.of(context).colorScheme.primary,
        ),
        label: Text(
          'Browse All Study Notes',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

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

  String _formatDateAgo(DateTime date) {
    final difference = DateTime.now().difference(date).inDays;
    if (difference == 0) return 'today';
    if (difference == 1) return '1 day ago';
    return '$difference days ago';
  }

  void _viewNoteDetails(BuildContext context, Note note) {
    context.push('/note-detail', extra: note.id);
  }

  void _startQuizMode(BuildContext context, Note note) {
    final exos = FakeData.getExosForNote(note.id);
    context.push(
      '/quiz-flow',
      extra: {'noteId': note.id, 'noteTitle': note.title, 'exos': exos},
    );
  }
}
