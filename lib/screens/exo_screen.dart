import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class ExoScreen extends StatefulWidget {
  const ExoScreen({super.key});

  @override
  State<ExoScreen> createState() => _ExoScreenState();
}

class _ExoScreenState extends State<ExoScreen>
    with TickerProviderStateMixin {
  late AnimationController _countdownController;
  late AnimationController _buzzController;
  late Animation<double> _countdownAnimation;
  late Animation<double> _buzzAnimation;
  
  int? _selectedAnswer;
  bool _hasAnswered = false;
  int _timeLeft = 15;
  String _feedbackMessage = '';
  bool _showingFeedback = false;

  // Mock question data
  final String _question = "What is the primary benefit of spaced repetition in learning?";
  final List<String> _answers = [
    "It makes studying more enjoyable",
    "It improves long-term memory retention",
    "It reduces study time significantly", 
    "It eliminates the need for review"
  ];
  final int _correctAnswer = 1;

  @override
  void initState() {
    super.initState();
    
    _countdownController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );
    
    _buzzController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _countdownAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _countdownController,
      curve: Curves.linear,
    ));
    
    _buzzAnimation = Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(CurvedAnimation(
      parent: _buzzController,
      curve: Curves.elasticOut,
    ));
    
    _startCountdown();
  }

  @override
  void dispose() {
    _countdownController.dispose();
    _buzzController.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _countdownController.forward();
    _countdownController.addListener(() {
      setState(() {
        _timeLeft = (15 * (1 - _countdownController.value)).ceil();
      });
      
      if (_countdownController.isCompleted && !_hasAnswered) {
        _timeUp();
      }
    });
  }

  void _selectAnswer(int index) {
    if (_hasAnswered) return;
    
    setState(() {
      _selectedAnswer = index;
      _hasAnswered = true;
    });
    
    _buzzController.forward().then((_) {
      _buzzController.reverse();
    });
    
    _countdownController.stop();
    _showFeedback();
  }

  void _timeUp() {
    setState(() {
      _hasAnswered = true;
      _feedbackMessage = "Time's up! Let's see the answer.";
    });
    _showFeedback();
  }

  void _showFeedback() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showingFeedback = true;
        if (_selectedAnswer == _correctAnswer) {
          _feedbackMessage = "Correct! +50 XP";
        } else if (_selectedAnswer != null) {
          _feedbackMessage = "Not quite right. The correct answer is highlighted.";
        }
      });
      
      // Auto-continue after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          // Return to listening session, don't end it
          context.pop();
        }
      });
    });
  }

  Color _getAnswerColor(int index) {
    if (!_showingFeedback) {
      if (_selectedAnswer == index) {
        return Theme.of(context).colorScheme.primary;
      }
      return Theme.of(context).colorScheme.surfaceContainerHighest;
    }
    
    // Showing feedback
    if (index == _correctAnswer) {
      return Theme.of(context).colorScheme.tertiary; // Green for correct
    } else if (_selectedAnswer == index && index != _correctAnswer) {
      return Colors.red.withOpacity(0.3); // Red for wrong selection
    }
    return Theme.of(context).colorScheme.surfaceContainerHighest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Progress and timer
              Row(
                children: [
                  Text(
                    'Question 3 of 8',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const Spacer(),
                  // Countdown Ring
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: AnimatedBuilder(
                          animation: _countdownAnimation,
                          builder: (context, child) {
                            return CircularProgressIndicator(
                              value: _countdownAnimation.value,
                              strokeWidth: 3,
                              backgroundColor: Theme.of(context).colorScheme.outline,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _timeLeft <= 5 ? Colors.red : Theme.of(context).colorScheme.secondary,
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        '$_timeLeft',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: _timeLeft <= 5 ? Colors.red : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Question
              AnimatedBuilder(
                animation: _buzzAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_buzzAnimation.value * ((_selectedAnswer ?? -1) % 2 == 0 ? 1 : -1), 0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        _question,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 32),
              
              // Answer Options
              Expanded(
                child: ListView.builder(
                  itemCount: _answers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => _selectAnswer(index),
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: _getAnswerColor(index),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: _selectedAnswer == index
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedAnswer == index
                                          ? Theme.of(context).colorScheme.primary
                                          : Theme.of(context).colorScheme.outline,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        String.fromCharCode(65 + index), // A, B, C, D
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      _answers[index],
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  if (_showingFeedback && index == _correctAnswer)
                                    const HeroIcon(
                                      HeroIcons.checkCircle,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              // Speed Indicator
              if (!_hasAnswered)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _timeLeft > 10 ? 'Think it through...' : 
                    _timeLeft > 5 ? 'Good pace!' : 'Almost!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              
              // Feedback Message
              if (_showingFeedback)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _selectedAnswer == _correctAnswer
                        ? Theme.of(context).colorScheme.tertiary.withOpacity(0.1)
                        : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _selectedAnswer == _correctAnswer
                          ? Theme.of(context).colorScheme.tertiary
                          : Colors.orange,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _feedbackMessage,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: _selectedAnswer == _correctAnswer
                              ? Theme.of(context).colorScheme.tertiary
                              : Colors.orange.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (_selectedAnswer == _correctAnswer) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Spaced repetition helps transfer information from short-term to long-term memory through strategic review intervals.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}