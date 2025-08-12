import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class SessionResultsScreen extends StatefulWidget {
  const SessionResultsScreen({super.key});

  @override
  State<SessionResultsScreen> createState() => _SessionResultsScreenState();
}

class _SessionResultsScreenState extends State<SessionResultsScreen>
    with TickerProviderStateMixin {
  late AnimationController _scoreController;
  late AnimationController _celebrationController;
  late AnimationController _badgeController;

  late Animation<double> _scoreAnimation;
  late Animation<double> _celebrationAnimation;
  late Animation<double> _badgeScaleAnimation;
  late Animation<double> _badgeRotationAnimation;

  // Mock session data
  final int _totalQuestions = 8;
  final int _correctAnswers = 6;
  final int _sessionTime = 247; // seconds
  final int _xpEarned = 180;
  final int _streakDays = 8;
  final bool _hasNewBadge = true;
  final String _newBadgeName = "Speed Demon";
  final String _newBadgeIcon = "⚡";
  final double _averageResponseTime = 12.5; // seconds

  @override
  void initState() {
    super.initState();

    // Score count-up animation
    _scoreController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Celebration particles animation
    _celebrationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Badge unlock animation
    _badgeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scoreAnimation =
        Tween<double>(
          begin: 0.0,
          end: _correctAnswers / _totalQuestions,
        ).animate(
          CurvedAnimation(parent: _scoreController, curve: Curves.easeOutCubic),
        );

    _celebrationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _celebrationController, curve: Curves.easeOut),
    );

    _badgeScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _badgeController, curve: Curves.elasticOut),
    );

    _badgeRotationAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(parent: _badgeController, curve: Curves.easeInOut),
    );

    // Start animations
    _startAnimations();
  }

  @override
  void dispose() {
    _scoreController.dispose();
    _celebrationController.dispose();
    _badgeController.dispose();
    super.dispose();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _scoreController.forward();

    await Future.delayed(const Duration(milliseconds: 1000));
    _celebrationController.forward();

    if (_hasNewBadge) {
      await Future.delayed(const Duration(milliseconds: 500));
      _badgeController.forward();
    }
  }

  double get _accuracy => _correctAnswers / _totalQuestions;

  String get _formattedTime {
    final minutes = (_sessionTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (_sessionTime % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get _performanceMessage {
    if (_accuracy >= 0.9) return "Outstanding performance!";
    if (_accuracy >= 0.75) return "Great job learning!";
    if (_accuracy >= 0.6) return "Good progress made!";
    return "Keep practicing!";
  }

  Color get _scoreColor {
    if (_accuracy >= 0.8) return Colors.green;
    if (_accuracy >= 0.6) return Theme.of(context).colorScheme.secondary;
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.primary.withOpacity(0.05),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Header
                  Text(
                    'Session Complete!',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    _performanceMessage,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Hero Score Circle
                  _buildHeroScore(),

                  const SizedBox(height: 40),

                  // New Badge Notification
                  if (_hasNewBadge) _buildBadgeUnlock(),

                  if (_hasNewBadge) const SizedBox(height: 32),

                  // Performance Breakdown
                  _buildPerformanceBreakdown(),

                  const SizedBox(height: 32),

                  // Progress Context
                  _buildProgressContext(),

                  const SizedBox(height: 32),

                  // Action Buttons
                  _buildActionButtons(),

                  const SizedBox(height: 24),

                  // Share Button
                  _buildShareButton(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroScore() {
    return AnimatedBuilder(
      animation: Listenable.merge([_scoreAnimation, _celebrationAnimation]),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Celebration particles
            if (_celebrationAnimation.value > 0)
              ...List.generate(8, (index) {
                final angle = (index * 45) * (3.14159 / 180);
                final distance = 100 * _celebrationAnimation.value;
                return Positioned(
                  left: 100 + (distance * math.cos(angle)),
                  top: 100 + (distance * math.sin(angle)),
                  child: Opacity(
                    opacity: 1 - _celebrationAnimation.value,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              }),

            // Main score circle
            Container(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background circle
                  CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 12,
                    backgroundColor: Theme.of(context).colorScheme.outline,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.outline,
                    ),
                  ),

                  // Animated progress
                  CircularProgressIndicator(
                    value: _scoreAnimation.value,
                    strokeWidth: 12,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(_scoreColor),
                  ),

                  // Score text
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(_scoreAnimation.value * 100).toInt()}%',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: _scoreColor,
                            ),
                      ),
                      Text(
                        '${(_scoreAnimation.value * _totalQuestions).toInt()}/$_totalQuestions correct',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBadgeUnlock() {
    return AnimatedBuilder(
      animation: _badgeController,
      builder: (context, child) {
        return Transform.scale(
          scale: _badgeScaleAnimation.value,
          child: Transform.rotate(
            angle: _badgeRotationAnimation.value,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        _newBadgeIcon,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'New Achievement!',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _newBadgeName,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPerformanceBreakdown() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Session Breakdown',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'XP Earned',
                  '+$_xpEarned',
                  HeroIcons.star,
                  _scoreColor,
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: Theme.of(context).colorScheme.outline,
              ),
              Expanded(
                child: _buildStatItem(
                  'Time',
                  _formattedTime,
                  HeroIcons.clock,
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Avg Speed',
                  '${_averageResponseTime.toInt()}s',
                  HeroIcons.bolt,
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: Theme.of(context).colorScheme.outline,
              ),
              Expanded(
                child: _buildStatItem(
                  'Streak',
                  '$_streakDays days',
                  HeroIcons.fire,
                  Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    HeroIcons icon,
    Color color,
  ) {
    return Column(
      children: [
        HeroIcon(icon, size: 24, color: color),
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
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressContext() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          HeroIcon(
            HeroIcons.trophy,
            size: 24,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'You\'re in the top 20% of learners today! Keep up the great work.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Play Again Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () => context.go('/mode-selection'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
              elevation: 8,
              shadowColor: Theme.of(
                context,
              ).colorScheme.secondary.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: const HeroIcon(HeroIcons.play, size: 20),
            label: const Text(
              'Ready for Another?',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Save to Knowledge Vault
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Study notes saved to your collection!'),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: HeroIcon(
              HeroIcons.bookOpen,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: Text(
              'Save to Knowledge Vault',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Return Home
        TextButton(
          onPressed: () => context.go('/home'),
          child: Text(
            'Return to Dashboard',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShareButton() {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: Implement screenshot + share functionality
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Share functionality coming soon!')),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: const HeroIcon(HeroIcons.share, size: 18),
        label: const Text(
          'Share Your Brain Gains',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
