import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class SocialProofCard extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final Duration delay;

  const SocialProofCard({
    super.key,
    this.text = 'Join 10K+ learners turning dead time into brain gains',
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.delay = const Duration(milliseconds: 600),
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: delay,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}