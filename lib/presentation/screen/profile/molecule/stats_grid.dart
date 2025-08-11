import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';

class StatsGrid extends StatelessWidget {
  final int totalXP;
  final int notesSaved;
  final int bestStreak;
  final double accuracy;

  const StatsGrid({
    super.key,
    required this.totalXP,
    required this.notesSaved,
    required this.bestStreak,
    required this.accuracy,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 200),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
        children: [
          _buildStatCard(
            context,
            'Total XP',
            totalXP.toString(),
            'Level ${(totalXP / 600).floor() + 1}',
            HeroIcons.star,
            Theme.of(context).colorScheme.secondary,
          ),
          _buildStatCard(
            context,
            'Notes Saved',
            notesSaved.toString(),
            'knowledge points',
            HeroIcons.bookOpen,
            Theme.of(context).colorScheme.primary,
          ),
          _buildStatCard(
            context,
            'Best Streak',
            '$bestStreak days',
            'personal best',
            HeroIcons.fire,
            Colors.orange,
          ),
          _buildStatCard(
            context,
            'Accuracy',
            '${(accuracy * 100).toInt()}%',
            'average score',
            HeroIcons.checkBadge,
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    String subtitle,
    HeroIcons icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroIcon(icon, size: 28, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}