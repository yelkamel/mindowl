import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class MicroCopyText extends StatelessWidget {
  final String text;
  final Duration delay;
  final double fontSize;

  const MicroCopyText({
    super.key,
    this.text = 'No signup required • Works with any audio • 30 seconds to first win',
    this.delay = const Duration(milliseconds: 1000),
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: delay,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}