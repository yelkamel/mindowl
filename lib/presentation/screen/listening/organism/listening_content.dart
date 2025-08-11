import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mindowl/enum/context_type.dart';
import 'package:mindowl/presentation/screen/listening/molecule/animated_microphone.dart';
import 'package:mindowl/presentation/screen/listening/molecule/context_detector.dart';
import 'package:mindowl/presentation/screen/listening/molecule/session_info_card.dart';
import 'package:mindowl/presentation/screen/listening/molecule/listening_control_buttons.dart';

class ListeningContent extends StatelessWidget {
  final bool isListening;
  final ContextType detectedContext;
  final String formattedTime;
  final String nextQuestionDisplay;
  final bool shouldShowWarning;
  final bool showBackButton;
  final VoidCallback? onBack;
  final VoidCallback? onPauseResume;
  final VoidCallback? onEndSession;

  const ListeningContent({
    super.key,
    required this.isListening,
    required this.detectedContext,
    required this.formattedTime,
    required this.nextQuestionDisplay,
    this.shouldShowWarning = false,
    this.showBackButton = false,
    this.onBack,
    this.onPauseResume,
    this.onEndSession,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Header with back button (only show if not actively listening)
          if (showBackButton && !isListening)
            Row(
              children: [
                IconButton(
                  icon: const HeroIcon(HeroIcons.arrowLeft),
                  onPressed: onBack,
                ),
                const Spacer(),
              ],
            ),

          const Spacer(flex: 2),

          // Animated Microphone
          AnimatedMicrophone(isListening: isListening, size: 160),

          const SizedBox(height: 40),

          // Status Text
          Text(
            isListening ? 'Listening to your world...' : 'Session Paused',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isListening
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Context Detector
          ContextDetector(contextType: detectedContext, isVisible: isListening),

          const Spacer(),

          // Session Info Card
          SessionInfoCard(
            formattedTime: formattedTime,
            nextQuestionDisplay: nextQuestionDisplay,
            shouldShowWarning: shouldShowWarning,
          ),

          const SizedBox(height: 24),

          // Control Buttons
          ListeningControlButtons(
            isListening: isListening,
            onPauseResume: onPauseResume,
            onEndSession: onEndSession,
          ),
        ],
      ),
    );
  }
}
