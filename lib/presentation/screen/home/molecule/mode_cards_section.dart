import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';

class ModeCardsSection extends StatelessWidget {
  final VoidCallback? onSoloModeTap;
  final VoidCallback? onBattleModeTap;

  const ModeCardsSection({
    super.key,
    this.onSoloModeTap,
    this.onBattleModeTap,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Your Mission',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _ModeCard(
                  title: 'Solo Mission',
                  subtitle: 'Focus Mode',
                  description: 'Master your mind',
                  icon: HeroIcons.userCircle,
                  color: Theme.of(context).colorScheme.tertiary,
                  onTap: onSoloModeTap,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _ModeCard(
                  title: 'Battle Mode',
                  subtitle: 'Group Challenge',
                  description: 'Challenge friends',
                  icon: HeroIcons.userGroup,
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: onBattleModeTap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final HeroIcons icon;
  final Color color;
  final VoidCallback? onTap;

  const _ModeCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroIcon(
                  icon,
                  size: 32,
                  color: color,
                ),
                const Spacer(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}