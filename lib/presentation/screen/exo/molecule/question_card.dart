import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final Animation<double> buzzAnimation;
  final int? selectedAnswer;

  const QuestionCard({
    super.key,
    required this.question,
    required this.buzzAnimation,
    this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 200),
      child: AnimatedBuilder(
        animation: buzzAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              buzzAnimation.value * ((selectedAnswer ?? -1) % 2 == 0 ? 1 : -1), 
              0
            ),
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
                question,
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
    );
  }
}