import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mindowl/enum/context_type.dart';

class ContextDetector extends StatelessWidget {
  final ContextType contextType;
  final bool isVisible;

  const ContextDetector({
    super.key,
    required this.contextType,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroIcon(
            _getContextIcon(contextType),
            size: 16,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          const SizedBox(width: 8),
          Text(
            _getContextText(contextType),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  HeroIcons _getContextIcon(ContextType type) {
    switch (type) {
      case ContextType.podcast:
        return HeroIcons.speakerWave;
      case ContextType.video:
        return HeroIcons.playCircle;
      case ContextType.audiobook:
        return HeroIcons.bookOpen;
      case ContextType.music:
        return HeroIcons.musicalNote;
      case ContextType.conversation:
        return HeroIcons.chatBubbleLeftRight;
      case ContextType.lecture:
        return HeroIcons.academicCap;
      case ContextType.meeting:
        return HeroIcons.userGroup;
      case ContextType.silence:
        return HeroIcons.speakerXMark;
      case ContextType.unknown:
        return HeroIcons.questionMarkCircle;
    }
  }

  String _getContextText(ContextType type) {
    // TODO: Replace with proper i18n localization
    switch (type) {
      case ContextType.podcast:
        return 'Podcast audio detected';
      case ContextType.video:
        return 'Video content detected';
      case ContextType.audiobook:
        return 'Audiobook detected';
      case ContextType.music:
        return 'Music detected';
      case ContextType.conversation:
        return 'Conversation detected';
      case ContextType.lecture:
        return 'Lecture detected';
      case ContextType.meeting:
        return 'Meeting detected';
      case ContextType.silence:
        return 'Silence detected';
      case ContextType.unknown:
        return 'Audio content detected';
    }
  }
}
