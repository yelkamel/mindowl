import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class SpeedIndicator extends StatelessWidget {
  final int timeLeft;

  const SpeedIndicator({
    super.key,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 500),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          _getSpeedMessage(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  String _getSpeedMessage() {
    if (timeLeft > 10) return 'Think it through...';
    if (timeLeft > 5) return 'Good pace!';
    return 'Almost!';
  }
}