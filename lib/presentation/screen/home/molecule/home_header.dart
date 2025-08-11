import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class HomeHeader extends StatelessWidget {
  final int streakDays;
  final VoidCallback? onProfileTap;

  const HomeHeader({
    super.key,
    required this.streakDays,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                HeroIcon(
                  HeroIcons.fire,
                  size: 20,
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                Text(
                  '$streakDays day streak',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: onProfileTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/logo.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}