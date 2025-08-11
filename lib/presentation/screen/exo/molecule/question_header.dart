import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class QuestionHeader extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final int timeLeft;
  final Animation<double> countdownAnimation;

  const QuestionHeader({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.timeLeft,
    required this.countdownAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Row(
        children: [
          Text(
            'Question $currentQuestion of $totalQuestions',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const Spacer(),
          _buildCountdownRing(context),
        ],
      ),
    );
  }

  Widget _buildCountdownRing(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: AnimatedBuilder(
            animation: countdownAnimation,
            builder: (context, child) {
              return CircularProgressIndicator(
                value: countdownAnimation.value,
                strokeWidth: 3,
                backgroundColor: Theme.of(context).colorScheme.outline,
                valueColor: AlwaysStoppedAnimation<Color>(
                  timeLeft <= 5 ? Colors.red : Theme.of(context).colorScheme.secondary,
                ),
              );
            },
          ),
        ),
        Text(
          '$timeLeft',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: timeLeft <= 5 ? Colors.red : Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}