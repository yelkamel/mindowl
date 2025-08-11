import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';

class StatsGrid extends StatelessWidget {
  final int todaySessions;
  final int totalXP;
  final int accuracyPercent;

  const StatsGrid({
    super.key,
    required this.todaySessions,
    required this.totalXP,
    required this.accuracyPercent,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 600),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              title: 'Today',
              value: todaySessions.toString(),
              subtitle: 'sessions',
              icon: HeroIcons.academicCap,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _StatCard(
              title: 'Total XP',
              value: totalXP.toString(),
              subtitle: 'points',
              icon: HeroIcons.star,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _StatCard(
              title: 'Accuracy',
              value: '$accuracyPercent%',
              subtitle: 'correct',
              icon: HeroIcons.checkBadge,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final HeroIcons icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          HeroIcon(
            icon,
            size: 24,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}