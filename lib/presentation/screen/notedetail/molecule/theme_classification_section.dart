import 'package:flutter/material.dart';
import 'package:mindowl/model/note.dart';
import 'package:layou_tools/layou_tools.dart';

class ThemeClassificationSection extends StatelessWidget {
  final Note note;
  final VoidCallback? onRelatedNotesTap;

  const ThemeClassificationSection({
    super.key,
    required this.note,
    this.onRelatedNotesTap,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 300),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _ThemeChip(
                  text: note.primaryTheme,
                  emoji: note.themeEmoji,
                  isPrimary: true,
                ),
                const SizedBox(width: 8),
                ...note.topics.take(2).map(
                  (topic) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _ThemeChip(
                      text: topic,
                      isPrimary: false,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (note.relatedNoteIds.isNotEmpty)
              TextButton.icon(
                onPressed: onRelatedNotesTap,
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
}

class _ThemeChip extends StatelessWidget {
  final String text;
  final String? emoji;
  final bool isPrimary;

  const _ThemeChip({
    required this.text,
    this.emoji,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPrimary
            ? Theme.of(context).colorScheme.primary
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isPrimary && emoji != null ? '$emoji $text' : text,
        style: TextStyle(
          color: isPrimary ? Colors.white : Colors.grey[700],
          fontSize: 12,
          fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}