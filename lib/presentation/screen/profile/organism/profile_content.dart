import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import '../molecule/profile_header.dart';
import '../molecule/stats_grid.dart';
import '../molecule/achievement_section.dart';
import '../molecule/notes_preview.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  String _avatarUrl = 'assets/logo.webp';
  String _userName = 'Alex Chen';
  String _userBio = 'Passionate learner exploring AI, psychology, and neuroscience through active listening.';
  final int _memberSince = 47;
  final int _totalXP = 2850;
  final int _notesSaved = 23;
  final int _bestStreak = 12;
  final double _accuracy = 0.84;

  final List<Achievement> _achievements = [
    Achievement(
      title: 'Speed Demon',
      icon: '⚡',
      description: 'Answer 10 questions in under 5 seconds',
      isUnlocked: true,
    ),
    Achievement(
      title: 'Knowledge Collector',
      icon: '📚',
      description: 'Save 20+ study notes',
      isUnlocked: true,
    ),
    Achievement(
      title: 'Streak Master',
      icon: '🔥',
      description: '7-day learning streak',
      isUnlocked: true,
    ),
    Achievement(
      title: 'Perfect Score',
      icon: '🎯',
      description: 'Get 100% accuracy in a session',
      isUnlocked: false,
      progress: 0.8,
    ),
  ];

  void _editAvatar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Avatar editor coming soon!')),
    );
  }

  void _handleNameChange(String newName) {
    setState(() {
      _userName = newName;
    });
  }

  void _handleBioChange(String newBio) {
    setState(() {
      _userBio = newBio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(0.95),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              ProfileHeader(
                avatarUrl: _avatarUrl,
                userName: _userName,
                userBio: _userBio,
                memberSince: _memberSince,
                onEditAvatar: _editAvatar,
                onNameChanged: _handleNameChange,
                onBioChanged: _handleBioChange,
              ),
              const SizedBox(height: 32),
              StatsGrid(
                totalXP: _totalXP,
                notesSaved: _notesSaved,
                bestStreak: _bestStreak,
                accuracy: _accuracy,
              ),
              const SizedBox(height: 32),
              AchievementSection(achievements: _achievements),
              const SizedBox(height: 32),
              NotesPreview(notesSaved: _notesSaved),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          icon: const HeroIcon(HeroIcons.arrowLeft),
          onPressed: () => context.pop(),
        ),
        const SizedBox(width: 8),
        Text(
          'Profile',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const HeroIcon(HeroIcons.cog6Tooth),
          onPressed: () => context.push('/settings'),
        ),
      ],
    );
  }
}