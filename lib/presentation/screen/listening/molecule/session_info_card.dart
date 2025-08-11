import 'package:flutter/material.dart';

class SessionInfoCard extends StatelessWidget {
  final String formattedTime;
  final String nextQuestionDisplay;
  final bool shouldShowWarning;

  const SessionInfoCard({
    super.key,
    required this.formattedTime,
    required this.nextQuestionDisplay,
    this.shouldShowWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoColumn(
                context,
                'Time',
                formattedTime,
                Theme.of(context).colorScheme.primary,
              ),
              Container(
                width: 1,
                height: 40,
                color: Theme.of(context).colorScheme.outline,
              ),
              _buildInfoColumn(
                context,
                'Next Question',
                nextQuestionDisplay,
                Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          if (shouldShowWarning) ...[
            const SizedBox(height: 16),
            Text(
              'Question incoming...',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoColumn(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}