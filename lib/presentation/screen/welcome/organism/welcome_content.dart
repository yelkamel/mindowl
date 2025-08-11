import 'package:flutter/material.dart';
import 'package:mindowl/presentation/screen/welcome/molecule/animated_logo.dart';
import 'package:mindowl/presentation/screen/welcome/molecule/value_proposition.dart';
import 'package:mindowl/presentation/screen/welcome/molecule/social_proof_card.dart';
import 'package:mindowl/presentation/screen/welcome/molecule/start_learning_button.dart';
import 'package:mindowl/presentation/screen/welcome/molecule/micro_copy_text.dart';

class WelcomeContent extends StatelessWidget {
  final VoidCallback? onStartLearning;
  final bool isLoading;
  final String appTitle;
  final String firstText;
  final String secondText;
  final String socialProofText;
  final String buttonText;
  final String microCopyText;

  const WelcomeContent({
    super.key,
    required this.onStartLearning,
    this.isLoading = false,
    this.appTitle = 'MindOwl',
    this.firstText = 'Time + Attention',
    this.secondText = 'Learning',
    this.socialProofText = 'Join 10K+ learners turning dead time into brain gains',
    this.buttonText = 'Start Learning Now',
    this.microCopyText = 'No signup required • Works with any audio • 30 seconds to first win',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Spacer(flex: 2),
          
          Text(
            appTitle,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          
          const SizedBox(height: 24),
          
          const AnimatedLogo(),
          
          const SizedBox(height: 40),
          
          ValueProposition(
            firstText: firstText,
            secondText: secondText,
          ),
          
          const Spacer(),
          
          SocialProofCard(text: socialProofText),
          
          const SizedBox(height: 32),
          
          StartLearningButton(
            onPressed: onStartLearning,
            isLoading: isLoading,
            text: buttonText,
          ),
          
          const SizedBox(height: 24),
          
          MicroCopyText(text: microCopyText),
          
          const Spacer(),
        ],
      ),
    );
  }
}