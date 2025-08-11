import 'package:flutter/material.dart';
import 'package:mindowl/model/exo.dart';
import 'package:layou_tools/layou_tools.dart';

class FeedbackSection extends StatelessWidget {
  final Exo exo;
  final dynamic selectedAnswer;
  final String feedbackMessage;
  final bool isVisible;

  const FeedbackSection({
    super.key,
    required this.exo,
    this.selectedAnswer,
    required this.feedbackMessage,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    final isCorrect = selectedAnswer == exo.correctAnswer;

    return EntranceFader(
      delay: const Duration(milliseconds: 500),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: isCorrect
              ? Theme.of(context).colorScheme.tertiary.withOpacity(0.1)
              : Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isCorrect
                ? Theme.of(context).colorScheme.tertiary
                : Colors.orange,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              feedbackMessage,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: isCorrect
                    ? Theme.of(context).colorScheme.tertiary
                    : Colors.orange.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            if (exo.explanation != null && isCorrect) ...[
              const SizedBox(height: 8),
              Text(
                exo.explanation!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
