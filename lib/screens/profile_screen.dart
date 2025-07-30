import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import '../data/fake_data.dart';
import '../models/note.dart';
import 'note_detail_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  late TextEditingController _nameController;
  late TextEditingController _bioController;
  bool _isEditingName = false;
  bool _isEditingBio = false;

  // Mock user data
  String _avatarUrl = 'assets/logo.webp';
  String _userName = 'Alex Chen';
  String _userBio =
      'Passionate learner exploring AI, psychology, and neuroscience through active listening.';
  int _memberSince = 47; // days
  int _totalXP = 2850;
  int _notesSaved = 23;
  int _bestStreak = 12;
  double _accuracy = 0.84;

  // Mock achievements
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

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _nameController = TextEditingController(text: _userName);
    _bioController = TextEditingController(text: _userBio);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _editAvatar() {
    // TODO: Implement image picker with circular crop
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Avatar editor coming soon!')));
  }

  void _saveName() {
    setState(() {
      _userName = _nameController.text;
      _isEditingName = false;
    });
  }

  void _saveBio() {
    setState(() {
      _userBio = _bioController.text;
      _isEditingBio = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  // Header with back button
                  Row(
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
                  ),

                  const SizedBox(height: 24),

                  // Profile Header Section (35% of content)
                  _buildProfileHeader(),

                  const SizedBox(height: 32),

                  // Quick Stats Grid
                  _buildStatsGrid(),

                  const SizedBox(height: 32),

                  // Achievement Ribbon (15% of content)
                  _buildAchievementSection(),

                  const SizedBox(height: 32),

                  // Study Notes Preview Section (50% of content)
                  _buildNotesPreviewSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar Editor
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: GestureDetector(
                  onTap: _editAvatar,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            _avatarUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.surface,
                                width: 2,
                              ),
                            ),
                            child: const HeroIcon(
                              HeroIcons.camera,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          // Name Field
          if (_isEditingName)
            TextField(
              controller: _nameController,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                ),
              ),
              onSubmitted: (_) => _saveName(),
              autofocus: true,
            )
          else
            GestureDetector(
              onTap: () => setState(() => _isEditingName = true),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _userName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  HeroIcon(
                    HeroIcons.pencil,
                    size: 16,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 8),

          // Member Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HeroIcon(
                  HeroIcons.trophy,
                  size: 16,
                  color: Colors.orange,
                ),
                const SizedBox(width: 6),
                Text(
                  'Learning since $_memberSince days',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Bio Section
          if (_isEditingBio)
            TextField(
              controller: _bioController,
              maxLines: 3,
              maxLength: 150,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Your learning journey...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                ),
              ),
              onSubmitted: (_) => _saveBio(),
            )
          else
            GestureDetector(
              onTap: () => setState(() => _isEditingBio = true),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      _userBio,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    HeroIcon(
                      HeroIcons.pencil,
                      size: 14,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: [
        _buildStatCard(
          'Total XP',
          _totalXP.toString(),
          'Level ${(_totalXP / 600).floor() + 1}',
          HeroIcons.star,
          Theme.of(context).colorScheme.secondary,
        ),
        _buildStatCard(
          'Notes Saved',
          _notesSaved.toString(),
          'knowledge points',
          HeroIcons.bookOpen,
          Theme.of(context).colorScheme.primary,
        ),
        _buildStatCard(
          'Best Streak',
          '$_bestStreak days',
          'personal best',
          HeroIcons.fire,
          Colors.orange,
        ),
        _buildStatCard(
          'Accuracy',
          '${(_accuracy * 100).toInt()}%',
          'average score',
          HeroIcons.checkBadge,
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildStatCard(
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
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
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

  Widget _buildAchievementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120, // Increased from 100 to 120
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _achievements.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final achievement = _achievements[index];
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
                  mainAxisSize: MainAxisSize.min, // Added this
                  children: [
                    Text(
                      achievement.icon,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      // Wrapped with Expanded
                      child: Text(
                        achievement.title,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: achievement.isUnlocked
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.6),
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
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.outline,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNotesPreviewSection() {
    return Column(
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
              'Your Study Notes',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(
              '$_notesSaved total',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Filter Pills
        Row(
          children: [
            _buildFilterChip('Recent', true),
            const SizedBox(width: 8),
            _buildFilterChip('Favorites', false),
            const SizedBox(width: 8),
            _buildFilterChip('Topics', false),
          ],
        ),

        const SizedBox(height: 16),

        // Mock Note Cards
        ...List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildNoteCard(index),
          ),
        ),

        const SizedBox(height: 16),

        // View All Button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            onPressed: () => context.push('/knowledge-vault'),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: HeroIcon(
              HeroIcons.arrowRight,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: Text(
              'Browse All Study Notes',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNoteCard(int index) {
    // Use actual notes from FakeData
    final notes = FakeData.notes.take(3).toList();
    if (index >= notes.length) return const SizedBox.shrink();

    final note = notes[index];
    final exos = FakeData.getExosForNote(note.id);
    final sessions = FakeData.getSessionsForNote(note.id);

    // Calculate average score
    final answeredExos = exos.where((e) => e.isAnswered);
    final averageScore = answeredExos.isEmpty
        ? 0.0
        : answeredExos.where((e) => e.isCorrect).length / answeredExos.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HeroIcon(
                _getSourceIcon(
                  sessions.isNotEmpty ? sessions.first.source : 'audio',
                ),
                size: 16,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  note.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: averageScore >= 0.85
                      ? Colors.green.withOpacity(0.1)
                      : Theme.of(
                          context,
                        ).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${(averageScore * 100).toInt()}%',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: averageScore >= 0.85
                        ? Colors.green
                        : Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            'Contains ${exos.length} questions • Reviewed ${_formatDateAgo(note.lastReviewed ?? note.createdAt)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _viewNoteDetails(note),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  icon: HeroIcon(
                    HeroIcons.bookOpen,
                    size: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'Read Note',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _startQuizMode(note),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 0,
                  ),
                  icon: const HeroIcon(HeroIcons.playCircle, size: 14),
                  label: const Text(
                    'Start Quiz',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper methods
  HeroIcons _getSourceIcon(String source) {
    switch (source) {
      case 'podcast':
        return HeroIcons.speakerWave;
      case 'video':
        return HeroIcons.videoCamera;
      case 'audio':
        return HeroIcons.musicalNote;
      default:
        return HeroIcons.documentText;
    }
  }

  String _formatDateAgo(DateTime date) {
    final difference = DateTime.now().difference(date).inDays;
    if (difference == 0) return 'today';
    if (difference == 1) return '1 day ago';
    return '$difference days ago';
  }

  void _viewNoteDetails(Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailScreen(noteId: note.id),
      ),
    );
  }

  void _startQuizMode(Note note) {
    final exos = FakeData.getExosForNote(note.id);
    context.push(
      '/quiz-flow',
      extra: {'noteId': note.id, 'noteTitle': note.title, 'exos': exos},
    );
  }
}

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
