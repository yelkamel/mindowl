import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class Achievement {
  final String title;
  final String icon;
  final String description;
  final bool isUnlocked;
  final double? progress;

  Achievement({
    required this.title,
    required this.icon,
    required this.description,
    this.isUnlocked = false,
    this.progress,
  });
}

class AchievementSection extends StatelessWidget {
  final List<Achievement> achievements;

  const AchievementSection({
    super.key,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Achievements',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: achievements.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final achievement = achievements[index];
                return _buildAchievementCard(context, achievement);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(BuildContext context, Achievement achievement) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: achievement.isUnlocked
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: achievement.isUnlocked
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            achievement.icon,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              achievement.title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: achievement.isUnlocked
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (!achievement.isUnlocked && achievement.progress != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: LinearProgressIndicator(
                value: achievement.progress,
                backgroundColor: Theme.of(context).colorScheme.outline,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}