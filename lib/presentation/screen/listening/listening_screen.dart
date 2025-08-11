import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mindowl/presentation/screen/listening/provider/listening_screen_notifier.dart';
import 'package:mindowl/presentation/screen/listening/organism/listening_content.dart';

class ListeningScreen extends ConsumerWidget {
  const ListeningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listeningScreenNotifierProvider);
    final notifier = ref.read(listeningScreenNotifierProvider.notifier);

    // Handle question navigation
    ref.listen(listeningScreenNotifierProvider, (previous, current) {
      if (current.isQuestionReady && (previous?.isQuestionReady != true)) {
        notifier.navigateToQuestion(context);
      }
      
      if (current.isSessionEnded && (previous?.isSessionEnded != true)) {
        notifier.navigateToResults(context);
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: ListeningContent(
          isListening: state.isListening,
          detectedContext: state.detectedContext,
          formattedTime: state.formattedTime,
          nextQuestionDisplay: state.nextQuestionDisplay,
          shouldShowWarning: state.shouldShowQuestionWarning,
          showBackButton: !state.isListening,
          onBack: () => context.pop(),
          onPauseResume: () {
            if (state.isListening) {
              notifier.pauseSession();
            } else {
              notifier.resumeSession();
            }
          },
          onEndSession: () => notifier.endSession(),
        ),
      ),
    );
  }
}