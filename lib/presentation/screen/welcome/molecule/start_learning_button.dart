import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class StartLearningButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;
  final double widthFactor;
  final double height;
  final Duration delay;

  const StartLearningButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.text = 'Start Learning Now',
    this.widthFactor = 0.7,
    this.height = 56,
    this.delay = const Duration(milliseconds: 800),
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return EntranceFader(
      delay: delay,
      child: SizedBox(
        width: screenWidth * widthFactor,
        height: height,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            elevation: 8,
            shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
      ),
    );
  }
}