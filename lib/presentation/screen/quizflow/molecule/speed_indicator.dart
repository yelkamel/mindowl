import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class SpeedIndicator extends StatelessWidget {
  final int timeLeft;
  final bool isVisible;

  const SpeedIndicator({
    super.key,
    required this.timeLeft,
    required this.isVisible,
  });

  String _getSpeedMessage() {
    if (timeLeft > 10) {
      return 'Think it through...';
    } else if (timeLeft > 5) {
      return 'Good pace!';
    } else {
      return 'Almost!';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return EntranceFader(
      delay: const Duration(milliseconds: 600),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          _getSpeedMessage(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
