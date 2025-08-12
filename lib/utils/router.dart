import 'package:go_router/go_router.dart';
import 'package:loggy/loggy.dart';
import 'package:mindowl/repository/service/auth_repository.dart';
import 'package:mindowl/presentation/screen/exo/exo_screen.dart';
import 'package:mindowl/presentation/screen/knowledgevault/knowledge_vault_screen.dart';
import 'package:mindowl/presentation/screen/profile/profile_screen.dart';
import 'package:mindowl/presentation/screen/quizflow/quizflow_screen.dart';

import 'package:mindowl/presentation/screen/welcome/welcome_screen.dart';
import 'package:mindowl/presentation/oldscreens/permission_screen.dart';
import 'package:mindowl/presentation/screen/home/home_screen.dart';
import 'package:mindowl/presentation/screen/modeselection/mode_selection_screen.dart';
import 'package:mindowl/presentation/screen/listening/listening_screen.dart';
import 'package:mindowl/presentation/oldscreens/group_setup_screen.dart';
import 'package:mindowl/presentation/oldscreens/group_listening_screen.dart';
import 'package:mindowl/presentation/oldscreens/session_results_screen.dart';
import 'package:mindowl/presentation/oldscreens/settings_screen.dart';
import 'package:mindowl/presentation/oldscreens/quiz_results_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final authRepository = AuthRepository();
    final isLoggedIn = authRepository.isUserConnected;

    if (state.fullPath == '/') {
      if (isLoggedIn) {
        logInfo('UID: ${authRepository.uid}');
      }
      return isLoggedIn ? '/home' : '/welcome';
    }

    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/permission',
      builder: (context, state) => const PermissionScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/mode-selection',
      builder: (context, state) => const ModeSelectionScreen(),
    ),
    GoRoute(
      path: '/listening',
      builder: (context, state) => const ListeningScreen(),
    ),
    GoRoute(
      path: '/group-setup',
      builder: (context, state) => const GroupSetupScreen(),
    ),
    GoRoute(path: '/exo', builder: (context, state) => const ExoScreen()),
    GoRoute(
      path: '/group-listening',
      builder: (context, state) => const GroupListeningScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/session-results',
      builder: (context, state) => const SessionResultsScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/knowledge-vault',
      builder: (context, state) => const KnowledgeVaultScreen(),
    ),
    GoRoute(
      path: '/quiz-flow',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return QuizFlowScreen(
          noteId: extra['noteId'],
          noteTitle: extra['noteTitle'],
          exos: extra['exos'],
        );
      },
    ),
    GoRoute(
      path: '/quiz-results',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return QuizResultsScreen(
          noteTitle: extra['noteTitle'],
          totalExos: extra['totalExos'],
          correctAnswers: extra['correctAnswers'],
          totalXpEarned: extra['totalXpEarned'],
          accuracy: extra['accuracy'],
          exos: extra['exos'],
        );
      },
    ),
  ],
);
