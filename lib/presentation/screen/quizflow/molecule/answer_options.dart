import 'package:flutter/material.dart';
import 'package:mindowl/model/exo.dart';
import 'package:layou_tools/layou_tools.dart';

class AnswerOptions extends StatelessWidget {
  final Exo exo;
  final dynamic selectedAnswer;
  final bool showFeedback;
  final Function(dynamic) onSelectAnswer;

  const AnswerOptions({
    super.key,
    required this.exo,
    this.selectedAnswer,
    this.showFeedback = false,
    required this.onSelectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 400),
      child: _buildAnswerOptions(),
    );
  }

  Widget _buildAnswerOptions() {
    switch (exo.type) {
      case ExoType.mcq:
        return _buildMultipleChoiceOptions();
      case ExoType.truefalse:
        return _buildTrueFalseOptions();
      case ExoType.short:
        return _buildSingleAnswerOption();

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildMultipleChoiceOptions() {
    return ListView.builder(
      itemCount: exo.options.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _OptionCard(
            value: index,
            label: String.fromCharCode(65 + index),
            text: exo.options[index],
            isSelected: selectedAnswer == index,
            isCorrect: showFeedback && index == exo.correctAnswer,
            showFeedback: showFeedback,
            onTap: () => onSelectAnswer(index),
          ),
        );
      },
    );
  }

  Widget _buildTrueFalseOptions() {
    return Column(
      children: [
        _OptionCard(
          value: true,
          label: '✓',
          text: 'True',
          isSelected: selectedAnswer == true,
          isCorrect: showFeedback && exo.correctAnswer == true,
          showFeedback: showFeedback,
          onTap: () => onSelectAnswer(true),
        ),
        const SizedBox(height: 16),
        _OptionCard(
          value: false,
          label: '✗',
          text: 'False',
          isSelected: selectedAnswer == false,
          isCorrect: showFeedback && exo.correctAnswer == false,
          showFeedback: showFeedback,
          onTap: () => onSelectAnswer(false),
        ),
      ],
    );
  }

  Widget _buildSingleAnswerOption() {
    return Builder(
      builder: (context) {
        return Column(
          children: [
            TextField(
              enabled: !showFeedback,
              decoration: InputDecoration(
                hintText: 'Type your answer...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              onSubmitted: (value) => onSelectAnswer(value),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: showFeedback
                    ? null
                    : () => onSelectAnswer("sample answer"),
                child: const Text('Submit Answer'),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _OptionCard extends StatelessWidget {
  final dynamic value;
  final String label;
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool showFeedback;
  final VoidCallback onTap;

  const _OptionCard({
    required this.value,
    required this.label,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.showFeedback,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(
      context,
    ).colorScheme.surfaceContainerHighest;
    Color borderColor = Colors.transparent;

    if (showFeedback) {
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
        onTap: showFeedback ? null : onTap,
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
                      : Colors.grey[400],
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
              if (showFeedback && isCorrect)
                const Icon(Icons.check_circle, color: Colors.green, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
