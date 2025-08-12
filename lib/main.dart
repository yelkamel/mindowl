import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/utils/log.dart';

import 'utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Log.init();
  initRepository();

  runApp(ProviderScope(child: MindOwlApp()));
}

class MindOwlApp extends StatelessWidget {
  const MindOwlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MindOwl',
      theme: _buildTheme(),
      routerConfig: goRouter,
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
