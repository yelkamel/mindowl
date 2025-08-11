import 'package:flutter/material.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/presentation/screen/quizflow/molecule/quiz_header.dart';
import 'package:mindowl/presentation/screen/quizflow/molecule/timer_display.dart';
import 'package:mindowl/presentation/screen/quizflow/molecule/question_card.dart';
import 'package:mindowl/presentation/screen/quizflow/molecule/answer_options.dart';
import 'package:mindowl/presentation/screen/quizflow/molecule/feedback_section.dart';
import 'package:mindowl/presentation/screen/quizflow/molecule/speed_indicator.dart';

class QuizFlowContent extends StatefulWidget {
  final String noteTitle;
  final int currentExoIndex;
  final int totalExos;
  final int totalXpEarned;
  final Exo currentExo;
  final VoidCallback? onExitQuiz;
  final Function(bool isCorrect, dynamic userAnswer) onExoCompleted;
  final VoidCallback onNextExo;

  const QuizFlowContent({
    super.key,
    required this.noteTitle,
    required this.currentExoIndex,
    required this.totalExos,
    required this.totalXpEarned,
    required this.currentExo,
    this.onExitQuiz,
    required this.onExoCompleted,
    required this.onNextExo,
  });

  @override
  State<QuizFlowContent> createState() => _QuizFlowContentState();
}

class _QuizFlowContentState extends State<QuizFlowContent> {
  dynamic _selectedAnswer;
  bool _hasAnswered = false;
  int _timeLeft = 15;
  String _feedbackMessage = '';
  bool _showingFeedback = false;
  bool _showBuzz = false;

  @override
  void initState() {
    super.initState();
    _resetForNewExo();
  }

  @override
  void didUpdateWidget(QuizFlowContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentExo.id != widget.currentExo.id) {
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
      _showBuzz = false;
    });
  }

  void _onTimeUp() {
    if (_hasAnswered) return;

    setState(() {
      _hasAnswered = true;
      _feedbackMessage = "Time's up! Let's see the answer.";
    });
    _showFeedback();
  }

  void _selectAnswer(dynamic answer) {
    if (_hasAnswered) return;

    setState(() {
      _selectedAnswer = answer;
      _hasAnswered = true;
      _showBuzz = true;
    });

    _showFeedback();
  }

  void _showFeedback() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        final isCorrect = _selectedAnswer == widget.currentExo.correctAnswer;

        setState(() {
          _showingFeedback = true;
          if (isCorrect) {
            _feedbackMessage = "Correct! +${widget.currentExo.xpReward} XP";
          } else if (_selectedAnswer != null) {
            _feedbackMessage =
                "Not quite right. The correct answer is highlighted.";
          }
        });

        widget.onExoCompleted(isCorrect, _selectedAnswer);

        // Auto advance after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            widget.onNextExo();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuizHeader(
          noteTitle: widget.noteTitle,
          currentExoIndex: widget.currentExoIndex,
          totalExos: widget.totalExos,
          totalXpEarned: widget.totalXpEarned,
          onExitQuiz: widget.onExitQuiz,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TimerDisplay(
                  totalSeconds: 15,
                  onTimeUp: _onTimeUp,
                  isActive: !_hasAnswered,
                ),
                const SizedBox(height: 40),
                QuestionCard(
                  question: widget.currentExo.question ?? 'ERROR',
                  showBuzz: _showBuzz,
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: AnswerOptions(
                    exo: widget.currentExo,
                    selectedAnswer: _selectedAnswer,
                    showFeedback: _showingFeedback,
                    onSelectAnswer: _selectAnswer,
                  ),
                ),
                SpeedIndicator(timeLeft: _timeLeft, isVisible: !_hasAnswered),
                FeedbackSection(
                  exo: widget.currentExo,
                  selectedAnswer: _selectedAnswer,
                  feedbackMessage: _feedbackMessage,
                  isVisible: _showingFeedback,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
