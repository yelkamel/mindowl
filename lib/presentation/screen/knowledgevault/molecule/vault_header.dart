import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';

class VaultHeader extends StatelessWidget {
  final int totalNotes;
  final bool isSearchExpanded;
  final Function() onSearchToggle;

  const VaultHeader({
    super.key,
    required this.totalNotes,
    required this.isSearchExpanded,
    required this.onSearchToggle,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            IconButton(
              icon: const HeroIcon(HeroIcons.arrowLeft),
              onPressed: () => context.pop(),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Knowledge Vault',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '$totalNotes study sessions',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: HeroIcon(
                isSearchExpanded ? HeroIcons.xMark : HeroIcons.magnifyingGlass,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: onSearchToggle,
            ),
          ],
        ),
      ),
    );
  }
}