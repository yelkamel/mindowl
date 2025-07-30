import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import '../models/exo.dart';

class QuizFlowScreen extends StatefulWidget {
  final String noteId;
  final String noteTitle;
  final List<Exo> exos;

  const QuizFlowScreen({
    super.key,
    required this.noteId,
    required this.noteTitle,
    required this.exos,
  });

  @override
  State<QuizFlowScreen> createState() => _QuizFlowScreenState();
}

class _QuizFlowScreenState extends State<QuizFlowScreen>
    with TickerProviderStateMixin {
  late AnimationController _transitionController;
  late Animation<Offset> _slideAnimation;

  int _currentExoIndex = 0;
  int _totalXpEarned = 0;
  int _correctAnswers = 0;

  @override
  void initState() {
    super.initState();

    _transitionController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _transitionController,
            curve: Curves.easeInOut,
          ),
        );

    _transitionController.forward();
  }

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  void _onExoCompleted(bool isCorrect, dynamic userAnswer) {
    setState(() {
      widget.exos[_currentExoIndex].isAnswered = true;
      widget.exos[_currentExoIndex].userAnswer = userAnswer;
      widget.exos[_currentExoIndex].isCorrect = isCorrect;

      if (isCorrect) {
        _correctAnswers++;
        _totalXpEarned += widget.exos[_currentExoIndex].xpReward;
      }
    });

    // Wait for feedback display then move to next exo
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _nextExo();
      }
    });
  }

  void _nextExo() {
    if (_currentExoIndex < widget.exos.length - 1) {
      setState(() {
        _currentExoIndex++;
      });

      // Animate to next exo
      _transitionController.reset();
      _transitionController.forward();
    } else {
      // Quiz completed, show results
      _showQuizResults();
    }
  }

  void _showQuizResults() {
    // Navigate to quiz results with earned XP and stats
    context.pushReplacement(
      '/quiz-results',
      extra: {
        'noteTitle': widget.noteTitle,
        'totalExos': widget.exos.length,
        'correctAnswers': _correctAnswers,
        'totalXpEarned': _totalXpEarned,
        'accuracy': _correctAnswers / widget.exos.length,
        'exos': widget.exos,
      },
    );
  }

  void _exitQuiz() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Quiz?'),
        content: const Text(
          'Your progress will be saved, but you won\'t earn XP for incomplete exos.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Continue Quiz'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop();
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentExo = widget.exos[_currentExoIndex];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with progress
            _buildHeader(),

            // Exo Content
            Expanded(
              child: SlideTransition(
                position: _slideAnimation,
                child: _buildExoContent(currentExo),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const HeroIcon(HeroIcons.xMark),
                onPressed: _exitQuiz,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.noteTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Exo ${_currentExoIndex + 1} of ${widget.exos.length}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeroIcon(
                      HeroIcons.star,
                      size: 16,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$_totalXpEarned XP',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Progress Bar
          LinearProgressIndicator(
            value: (_currentExoIndex + 1) / widget.exos.length,
            backgroundColor: Theme.of(context).colorScheme.outline,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExoContent(Exo exo) {
    return SingleExoScreen(exo: exo, onCompleted: _onExoCompleted);
  }
}

// Single Exo Screen Widget
class SingleExoScreen extends StatefulWidget {
  final Exo exo;
  final Function(bool isCorrect, dynamic userAnswer) onCompleted;

  const SingleExoScreen({
    super.key,
    required this.exo,
    required this.onCompleted,
  });

  @override
  State<SingleExoScreen> createState() => _SingleExoScreenState();
}

class _SingleExoScreenState extends State<SingleExoScreen>
    with TickerProviderStateMixin {
  late AnimationController _countdownController;
  late AnimationController _buzzController;
  late Animation<double> _countdownAnimation;
  late Animation<double> _buzzAnimation;

  dynamic _selectedAnswer;
  bool _hasAnswered = false;
  int _timeLeft = 15;
  String _feedbackMessage = '';
  bool _showingFeedback = false;

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

    _countdownAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _countdownController, curve: Curves.linear),
    );

    _buzzAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _buzzController, curve: Curves.elasticOut),
    );

    _startCountdown();
  }

  @override
  void didUpdateWidget(SingleExoScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset state when moving to a new exo
    if (oldWidget.exo.id != widget.exo.id) {
      _resetForNewExo();
    }
  }

  void _resetForNewExo() {
    setState(() {
      _selectedAnswer = null;
      _hasAnswered = false;
      _timeLeft = 15;
      _feedbackMessage = '';
      _showingFeedback = false;
    });
    _startCountdown();
  }

  @override
  void dispose() {
    _countdownController.dispose();
    _buzzController.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _countdownController.reset();
    _countdownController.forward();
    _countdownController.addListener(() {
      if (mounted) {
        setState(() {
          _timeLeft = (15 * (1 - _countdownController.value)).ceil();
        });

        if (_countdownController.isCompleted && !_hasAnswered) {
          _timeUp();
        }
      }
    });
  }

  void _selectAnswer(dynamic answer) {
    if (_hasAnswered) return;

    setState(() {
      _selectedAnswer = answer;
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
      if (mounted) {
        final isCorrect = _selectedAnswer == widget.exo.correctAnswer;

        setState(() {
          _showingFeedback = true;
          if (isCorrect) {
            _feedbackMessage = "Correct! +${widget.exo.xpReward} XP";
          } else if (_selectedAnswer != null) {
            _feedbackMessage =
                "Not quite right. The correct answer is highlighted.";
          }
        });

        // Notify parent about completion
        widget.onCompleted(isCorrect, _selectedAnswer);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Timer
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.outline,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _timeLeft <= 5
                                ? Colors.red
                                : Theme.of(context).colorScheme.secondary,
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    '$_timeLeft',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: _timeLeft <= 5
                          ? Colors.red
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Question
          GestureDetector(
            onLongPress: () {
              if (!_hasAnswered) {
                widget.onCompleted(false, null);
              }
            },
            child: AnimatedBuilder(
              animation: _buzzAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    _buzzAnimation.value *
                        ((_selectedAnswer.toString().length % 2 == 0) ? 1 : -1),
                    0,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      widget.exo.question,
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
          ),

          const SizedBox(height: 32),

          // Answer Options based on exo type
          Expanded(child: _buildAnswerOptions()),

          // Speed Indicator
          if (!_hasAnswered)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _timeLeft > 10
                    ? 'Think it through...'
                    : _timeLeft > 5
                    ? 'Good pace!'
                    : 'Almost!',
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
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: _selectedAnswer == widget.exo.correctAnswer
                    ? Theme.of(context).colorScheme.tertiary.withOpacity(0.1)
                    : Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _selectedAnswer == widget.exo.correctAnswer
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
                      color: _selectedAnswer == widget.exo.correctAnswer
                          ? Theme.of(context).colorScheme.tertiary
                          : Colors.orange.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (widget.exo.explanation != null &&
                      _selectedAnswer == widget.exo.correctAnswer) ...[
                    const SizedBox(height: 8),
                    Text(
                      widget.exo.explanation!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.8),
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
    );
  }

  Widget _buildAnswerOptions() {
    switch (widget.exo.type) {
      case ExoType.multipleChoice:
        return _buildMultipleChoiceOptions();
      case ExoType.trueFalse:
        return _buildTrueFalseOptions();
      case ExoType.singleAnswer:
        return _buildSingleAnswerOption();
    }
  }

  Widget _buildMultipleChoiceOptions() {
    return ListView.builder(
      itemCount: widget.exo.options.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildOptionCard(
            index,
            String.fromCharCode(65 + index), // A, B, C, D
            widget.exo.options[index],
            index == _selectedAnswer,
            _showingFeedback && index == widget.exo.correctAnswer,
          ),
        );
      },
    );
  }

  Widget _buildTrueFalseOptions() {
    return Column(
      children: [
        _buildOptionCard(
          true,
          '✓',
          'True',
          _selectedAnswer == true,
          _showingFeedback && widget.exo.correctAnswer == true,
        ),
        const SizedBox(height: 16),
        _buildOptionCard(
          false,
          '✗',
          'False',
          _selectedAnswer == false,
          _showingFeedback && widget.exo.correctAnswer == false,
        ),
      ],
    );
  }

  Widget _buildSingleAnswerOption() {
    return Column(
      children: [
        TextField(
          enabled: !_hasAnswered,
          decoration: InputDecoration(
            hintText: 'Type your answer...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          onSubmitted: (value) => _selectAnswer(value),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: _hasAnswered
                ? null
                : () {
                    final controller = context
                        .findAncestorStateOfType<_SingleExoScreenState>();
                    // TODO: Get text from TextField
                    _selectAnswer("sample answer");
                  },
            child: const Text('Submit Answer'),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard(
    dynamic value,
    String label,
    String text,
    bool isSelected,
    bool isCorrect,
  ) {
    Color backgroundColor = Theme.of(
      context,
    ).colorScheme.surfaceContainerHighest;
    Color borderColor = Colors.transparent;

    if (_showingFeedback) {
      if (isCorrect) {
        backgroundColor = Theme.of(
          context,
        ).colorScheme.tertiary.withOpacity(0.2);
        borderColor = Theme.of(context).colorScheme.tertiary;
      } else if (isSelected && !isCorrect) {
        backgroundColor = Colors.red.withOpacity(0.2);
        borderColor = Colors.red;
      }
    } else if (isSelected) {
      backgroundColor = Theme.of(context).colorScheme.primary.withOpacity(0.1);
      borderColor = Theme.of(context).colorScheme.primary;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _selectAnswer(value),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    label,
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
                  text,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              if (_showingFeedback && isCorrect)
                const HeroIcon(
                  HeroIcons.checkCircle,
                  color: Colors.green,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
