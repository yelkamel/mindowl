import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mindowl/presentation/screen/home/molecule/home_header.dart';
import 'package:mindowl/presentation/screen/home/molecule/hero_learning_card.dart';
import 'package:mindowl/presentation/screen/home/molecule/progress_ring.dart';
import 'package:mindowl/presentation/screen/home/molecule/stats_grid.dart';
import 'package:mindowl/presentation/screen/home/molecule/mode_cards_section.dart';
import 'package:mindowl/presentation/screen/home/molecule/knowledge_vault_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data - will be replaced by data provider later
    const currentStreak = 7;
    const currentLevel = 3;
    const currentXP = 450;
    const maxXP = 600;
    const todaySessions = 3;
    const totalXP = 2850;
    const accuracy = 0.82;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(
                  streakDays: currentStreak,
                  onProfileTap: () => context.push('/profile'),
                ),
                
                const SizedBox(height: 32),
                
                HeroLearningCard(
                  onTap: () => context.push('/mode-selection'),
                ),
                
                const SizedBox(height: 32),
                
                Center(
                  child: ProgressRing(
                    currentLevel: currentLevel,
                    currentXP: currentXP,
                    maxXP: maxXP,
                  ),
                ),
                
                const SizedBox(height: 32),
                
                StatsGrid(
                  todaySessions: todaySessions,
                  totalXP: totalXP,
                  accuracyPercent: (accuracy * 100).toInt(),
                ),
                
                const SizedBox(height: 32),
                
                ModeCardsSection(
                  onSoloModeTap: () => context.push('/mode-selection'),
                  onBattleModeTap: () => context.push('/mode-selection'),
                ),
                
                const SizedBox(height: 32),
                
                KnowledgeVaultSection(
                  onViewVaultTap: () => context.push('/knowledge-vault'),
                ),
              ],
            ),
          ),
        ),
      ),
      
      // Floating Action Button for instant start
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/mode-selection'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        elevation: 8,
        icon: HeroIcon(
          HeroIcons.microphone,
          size: 24,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        label: Text(
          'Quick Start',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}