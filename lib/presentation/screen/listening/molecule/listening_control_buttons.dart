import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ListeningControlButtons extends StatelessWidget {
  final bool isListening;
  final VoidCallback? onPauseResume;
  final VoidCallback? onEndSession;

  const ListeningControlButtons({
    super.key,
    required this.isListening,
    this.onPauseResume,
    this.onEndSession,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: ElevatedButton.icon(
              onPressed: onPauseResume,
              style: ElevatedButton.styleFrom(
                backgroundColor: isListening
                    ? Theme.of(context).colorScheme.outline
                    : Theme.of(context).colorScheme.secondary,
                foregroundColor: isListening
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.onSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: HeroIcon(
                isListening ? HeroIcons.pause : HeroIcons.play,
                size: 20,
              ),
              label: Text(
                isListening ? 'Pause' : 'Resume',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 56,
            child: OutlinedButton.icon(
              onPressed: onEndSession,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: HeroIcon(
                HeroIcons.stop,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: Text(
                'End Session',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}