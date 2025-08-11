import 'package:flutter/material.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/data/fake_data.dart';
import 'package:mindowl/presentation/screen/quizflow/organism/quiz_flow_content.dart';

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

class _QuizFlowScreenState extends State<QuizFlowScreen> {
  int _currentExoIndex = 0;
  int _totalXpEarned = 0;
  int _correctAnswers = 0;
  List<Exo> _exos = [];

  @override
  void initState() {
    super.initState();
    _exos = List.from(widget.exos);
  }

  void _onExoCompleted(bool isCorrect, dynamic userAnswer) {
    setState(() {
      _exos[_currentExoIndex] = _exos[_currentExoIndex].copyWith(
        isAnswered: true,
        userAnswer: userAnswer,
        isCorrect: isCorrect,
      );

      if (isCorrect) {
        _correctAnswers++;
        _totalXpEarned += _exos[_currentExoIndex].xpReward ?? 9999;
      }
    });
  }

  void _nextExo() {
    if (_currentExoIndex < _exos.length - 1) {
      setState(() {
        _currentExoIndex++;
      });
    } else {
      _showQuizResults();
    }
  }

  void _showQuizResults() {
    Navigator.of(context).pushReplacementNamed(
      '/quiz-results',
      arguments: {
        'noteTitle': widget.noteTitle,
        'totalExos': _exos.length,
        'correctAnswers': _correctAnswers,
        'totalXpEarned': _totalXpEarned,
        'accuracy': _correctAnswers / _exos.length,
        'exos': _exos,
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
              Navigator.of(context).pop();
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentExo = _exos[_currentExoIndex];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: QuizFlowContent(
          noteTitle: widget.noteTitle,
          currentExoIndex: _currentExoIndex,
          totalExos: _exos.length,
          totalXpEarned: _totalXpEarned,
          currentExo: currentExo,
          onExitQuiz: _exitQuiz,
          onExoCompleted: _onExoCompleted,
          onNextExo: _nextExo,
        ),
      ),
    );
  }
}
