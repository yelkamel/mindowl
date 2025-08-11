import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../molecule/question_header.dart';
import '../molecule/question_card.dart';
import '../molecule/answer_option.dart';
import '../molecule/speed_indicator.dart';
import '../molecule/feedback_card.dart';

class ExoContent extends StatefulWidget {
  const ExoContent({super.key});

  @override
  State<ExoContent> createState() => _ExoContentState();
}

class _ExoContentState extends State<ExoContent>
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
          context.pop();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          QuestionHeader(
            currentQuestion: 3,
            totalQuestions: 8,
            timeLeft: _timeLeft,
            countdownAnimation: _countdownAnimation,
          ),
          
          const SizedBox(height: 40),
          
          QuestionCard(
            question: _question,
            buzzAnimation: _buzzAnimation,
            selectedAnswer: _selectedAnswer,
          ),
          
          const SizedBox(height: 32),
          
          Expanded(
            child: ListView.builder(
              itemCount: _answers.length,
              itemBuilder: (context, index) {
                return AnswerOption(
                  index: index,
                  text: _answers[index],
                  isSelected: _selectedAnswer == index,
                  showFeedback: _showingFeedback,
                  isCorrect: index == _correctAnswer,
                  correctAnswer: _correctAnswer,
                  onTap: _selectAnswer,
                );
              },
            ),
          ),
          
          if (!_hasAnswered)
            SpeedIndicator(timeLeft: _timeLeft),
          
          if (_showingFeedback)
            FeedbackCard(
              message: _feedbackMessage,
              isCorrect: _selectedAnswer == _correctAnswer,
              explanation: _selectedAnswer == _correctAnswer
                  ? 'Spaced repetition helps transfer information from short-term to long-term memory through strategic review intervals.'
                  : null,
            ),
          
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}