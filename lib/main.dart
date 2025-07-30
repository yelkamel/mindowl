import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/welcome_screen.dart';
import 'screens/permission_screen.dart';
import 'screens/home_screen.dart';
import 'screens/mode_selection_screen.dart';
import 'screens/listening_screen.dart';
import 'screens/group_setup_screen.dart';
import 'screens/exo_screen.dart';
import 'screens/group_listening_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/session_results_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/knowledge_vault_screen.dart';
import 'screens/quiz_flow_screen.dart';
import 'screens/quiz_results_screen.dart';

void main() {
  runApp(MindOwlApp());
}

class MindOwlApp extends StatelessWidget {
  MindOwlApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/welcome',
    routes: [
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
      GoRoute(
        path: '/exo',
        builder: (context, state) => const ExoScreen(),
      ),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MindOwl',
      theme: _buildTheme(),
      routerConfig: _router,
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color scheme based on logo colors
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2D5B4A), // Deep green from logo
        secondary: Color(0xFFE6B342), // Golden yellow from logo
        surface: Color(0xFFF5F2E8), // Soft cream background
        onSurface: Color(0xFF2D5B4A), // Dark green text on light
        onPrimary: Color(0xFFF5F2E8), // Cream text on green
        onSecondary: Color(0xFF2D5B4A), // Dark green on golden
        tertiary: Color(0xFF4A7A62), // Medium green (success)
        surfaceContainerHighest: Color(0xFFE8F0ED), // Light green tint
        outline: Color(0xFFD0D7D4), // Subtle border color
      ),

      // Background color
      scaffoldBackgroundColor: const Color(0xFFF5F2E8), // Soft cream
      // Typography
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2D5B4A), // Dark green
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2D5B4A),
          height: 1.3,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2D5B4A),
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Color(0xFF2D5B4A),
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Color(0xFF2D5B4A),
          height: 1.4,
        ),
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2D5B4A), // Deep green from logo
          foregroundColor: const Color(0xFFF5F2E8), // Cream text
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: const Color(0xFFE8F0ED), // Light green tint
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // App bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF5F2E8), // Soft cream
        foregroundColor: Color(0xFF2D5B4A), // Dark green
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
