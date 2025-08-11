import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class FeedbackCard extends StatelessWidget {
  final String message;
  final bool isCorrect;
  final String? explanation;

  const FeedbackCard({
    super.key,
    required this.message,
    required this.isCorrect,
    this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 600),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
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
              message,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: isCorrect
                    ? Theme.of(context).colorScheme.tertiary
                    : Colors.orange.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            if (isCorrect && explanation != null) ...[
              const SizedBox(height: 8),
              Text(
                explanation!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
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