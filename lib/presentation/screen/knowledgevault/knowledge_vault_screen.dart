import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'organism/vault_content.dart';

class KnowledgeVaultScreen extends StatelessWidget {
  const KnowledgeVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: VaultContent(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/mode-selection'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        icon: const HeroIcon(HeroIcons.plus, size: 20),
        label: const Text(
          'New Session',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}