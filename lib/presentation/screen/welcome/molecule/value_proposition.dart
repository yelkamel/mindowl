import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';

class ValueProposition extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Duration delay;

  const ValueProposition({
    super.key,
    this.firstText = 'Time + Attention',
    this.secondText = 'Learning',
    this.delay = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: delay,
      offset: const Offset(0, 0.3),
      child: Column(
        children: [
          Text(
            firstText,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: HeroIcon(
                  HeroIcons.plus,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 20,
                ),
              ),
              Container(
                width: 40,
                height: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            secondText,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}