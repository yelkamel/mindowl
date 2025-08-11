import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class QuestionCard extends StatefulWidget {
  final String question;
  final bool showBuzz;

  const QuestionCard({
    super.key,
    required this.question,
    this.showBuzz = false,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _buzzController;
  late Animation<double> _buzzAnimation;

  @override
  void initState() {
    super.initState();
    
    _buzzController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _buzzAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _buzzController, curve: Curves.elasticOut),
    );

    if (widget.showBuzz) {
      _triggerBuzz();
    }
  }

  @override
  void didUpdateWidget(QuestionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showBuzz && !oldWidget.showBuzz) {
      _triggerBuzz();
    }
  }

  void _triggerBuzz() {
    _buzzController.forward().then((_) {
      _buzzController.reverse();
    });
  }

  @override
  void dispose() {
    _buzzController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 300),
      child: AnimatedBuilder(
        animation: _buzzAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              _buzzAnimation.value * (widget.question.length % 2 == 0 ? 1 : -1),
              0,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Text(
                widget.question,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
