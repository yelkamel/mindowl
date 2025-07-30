import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import '../models/exo.dart';

class QuizResultsScreen extends StatefulWidget {
  final String noteTitle;
  final int totalExos;
  final int correctAnswers;
  final int totalXpEarned;
  final double accuracy;
  final List<Exo> exos;

  const QuizResultsScreen({
    super.key,
    required this.noteTitle,
    required this.totalExos,
    required this.correctAnswers,
    required this.totalXpEarned,
    required this.accuracy,
    required this.exos,
  });

  @override
  State<QuizResultsScreen> createState() => _QuizResultsScreenState();
}

class _QuizResultsScreenState extends State<QuizResultsScreen>
    with TickerProviderStateMixin {
  late AnimationController _celebrationController;
  late AnimationController _progressController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _celebrationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _celebrationController, curve: Curves.elasticOut),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: widget.accuracy)
        .animate(
          CurvedAnimation(
            parent: _progressController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Start animations
    _celebrationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _progressController.forward();
      }
    });
  }

  @override
  void dispose() {
    _celebrationController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  String get _performanceMessage {
    if (widget.accuracy >= 0.9) return "Outstanding mastery!";
    if (widget.accuracy >= 0.8) return "Excellent work!";
    if (widget.accuracy >= 0.7) return "Great progress!";
    if (widget.accuracy >= 0.6) return "Good effort!";
    return "Keep practicing!";
  }

  Color get _performanceColor {
    if (widget.accuracy >= 0.8) return Theme.of(context).colorScheme.tertiary;
    if (widget.accuracy >= 0.6) return Theme.of(context).colorScheme.secondary;
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: const HeroIcon(HeroIcons.xMark),
                    onPressed: () => context.go('/knowledge-vault'),
                  ),
                  Expanded(
                    child: Text(
                      'Quiz Complete',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the close button
                ],
              ),

              const SizedBox(height: 32),

              // Celebration Section
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Column(
                      children: [
                        // Success Icon
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                _performanceColor,
                                _performanceColor.withOpacity(0.8),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _performanceColor.withOpacity(0.3),
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: HeroIcon(
                            widget.accuracy >= 0.8
                                ? HeroIcons.trophy
                                : HeroIcons.star,
                            size: 60,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Performance Message
                        Text(
                          _performanceMessage,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: _performanceColor,
                              ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 8),

                        // Note Title
                        Text(
                          widget.noteTitle,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

              // Stats Section
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Accuracy Circle
                    AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (context, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                value: _progressAnimation.value,
                                strokeWidth: 8,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.outline,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  _performanceColor,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '${(_progressAnimation.value * 100).round()}%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: _performanceColor,
                                      ),
                                ),
                                Text(
                                  'Accuracy',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.6),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    // Stats Grid
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            'Questions',
                            '${widget.correctAnswers}/${widget.totalExos}',
                            HeroIcons.questionMarkCircle,
                            Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildStatCard(
                            'XP Earned',
                            '${widget.totalXpEarned}',
                            HeroIcons.star,
                            Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Review Section
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Review',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget.exos.length,
                          itemBuilder: (context, index) {
                            final exo = widget.exos[index];
                            return _buildReviewItem(exo, index + 1);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Retry quiz with same exos
                          context.pushReplacement(
                            '/quiz-flow',
                            extra: {
                              'noteId': 'retry',
                              'noteTitle': widget.noteTitle,
                              'exos': widget.exos
                                  .map(
                                    (exo) => Exo(
                                      id: exo.id,
                                      question: exo.question,
                                      type: exo.type,
                                      options: exo.options,
                                      correctAnswer: exo.correctAnswer,
                                      xpReward: exo.xpReward,
                                      explanation: exo.explanation,
                                      noteId: '',
                                      createdAt: DateTime.now(),
                                    ),
                                  )
                                  .toList(),
                            },
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: HeroIcon(
                          HeroIcons.arrowPath,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'Try Again',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: () => context.go('/knowledge-vault'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const HeroIcon(HeroIcons.bookOpen, size: 20),
                        label: const Text(
                          'Continue Learning',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    HeroIcons icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          HeroIcon(icon, size: 24, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(Exo exo, int questionNumber) {
    final isCorrect = exo.isCorrect;
    final color = isCorrect
        ? Theme.of(context).colorScheme.tertiary
        : Colors.orange;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  '$questionNumber',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exo.question,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isCorrect ? 'Correct (+${exo.xpReward} XP)' : 'Incorrect',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            HeroIcon(
              isCorrect ? HeroIcons.checkCircle : HeroIcons.xCircle,
              size: 20,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
