import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';

class KnowledgeVaultSection extends StatelessWidget {
  final VoidCallback? onViewVaultTap;

  const KnowledgeVaultSection({
    super.key,
    this.onViewVaultTap,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 1000),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HeroIcon(
                  HeroIcons.bookOpen,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'Knowledge Vault',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Recent sessions saved as collected knowledge. Tap to review and reinforce your learning.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: onViewVaultTap,
              icon: HeroIcon(
                HeroIcons.arrowRight,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: Text(
                'View Knowledge Vault',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}