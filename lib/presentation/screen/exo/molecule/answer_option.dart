import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';

class AnswerOption extends StatelessWidget {
  final int index;
  final String text;
  final bool isSelected;
  final bool showFeedback;
  final bool isCorrect;
  final int correctAnswer;
  final Function(int) onTap;

  const AnswerOption({
    super.key,
    required this.index,
    required this.text,
    required this.isSelected,
    required this.showFeedback,
    required this.isCorrect,
    required this.correctAnswer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: Duration(milliseconds: 300 + (index * 100)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: showFeedback ? null : () => onTap(index),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _getAnswerColor(context),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
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
                        color: isSelected
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
                        text,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (showFeedback && index == correctAnswer)
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
      ),
    );
  }

  Color _getAnswerColor(BuildContext context) {
    if (!showFeedback) {
      if (isSelected) {
        return Theme.of(context).colorScheme.primary;
      }
      return Theme.of(context).colorScheme.surfaceContainerHighest;
    }

    // Showing feedback
    if (index == correctAnswer) {
      return Theme.of(context).colorScheme.tertiary; // Green for correct
    } else if (isSelected && index != correctAnswer) {
      return Colors.red.withOpacity(0.3); // Red for wrong selection
    }
    return Theme.of(context).colorScheme.surfaceContainerHighest;
  }
}