import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindowl/repository/service/auth_repository.dart';
import 'package:mindowl/repository/database/user_repository.dart';
import 'package:mindowl/usecases/user_logged_anonymously_usecase.dart';
import 'package:mindowl/presentation/screen/welcome/organism/welcome_content.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final UserLoggedAnonymouslyUseCase _loginUseCase =
      UserLoggedAnonymouslyUseCase();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WelcomeContent(
          onStartLearning: _handleStartLearning,
          isLoading: _isLoading,
        ),
      ),
    );
  }

  Future<void> _handleStartLearning() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final result = await _loginUseCase();

    result.fold(
      (failure) {
        setState(() {
          _isLoading = false;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      (user) {
        setState(() {
          _isLoading = false;
        });

        if (mounted) {
          context.go('/home');
        }
      },
    );
  }
}
