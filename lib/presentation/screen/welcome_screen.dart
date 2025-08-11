import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mindowl/repository/service/auth_repository.dart';
import 'package:mindowl/repository/database/user_repository.dart';
import 'package:mindowl/usecases/user_logged_anonymously_usecase.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _brainAnimationController;
  late AnimationController _textAnimationController;
  late Animation<double> _brainPulseAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;

  late UserLoggedAnonymouslyUseCase _loginUseCase;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Initialize use case
    _loginUseCase = UserLoggedAnonymouslyUseCase(
      AuthRepository(),
      UserRepository(),
    );

    // Brain animation controller
    _brainAnimationController = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    )..repeat(reverse: true);

    // Text animation controller
    _textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Brain pulse animation
    _brainPulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _brainAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Text fade animation
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    // Text slide animation
    _textSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _textAnimationController,
            curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
          ),
        );

    // Start text animation
    _textAnimationController.forward();
  }

  @override
  void dispose() {
    _brainAnimationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Text(
                'MindOwl',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 24),
              // Hero Brain Animation
              AnimatedBuilder(
                animation: _brainPulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _brainPulseAnimation.value,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Theme.of(
                              context,
                            ).colorScheme.secondary.withOpacity(0.3),
                            Theme.of(
                              context,
                            ).colorScheme.secondary.withOpacity(0.1),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.7, 1.0],
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset('assets/logo.webp'),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

              // Value Proposition with Animation
              SlideTransition(
                position: _textSlideAnimation,
                child: FadeTransition(
                  opacity: _textFadeAnimation,
                  child: Column(
                    children: [
                      Text(
                        'Time + Attention',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
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
                        'Learning',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Social Proof
              FadeTransition(
                opacity: _textFadeAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Join 10K+ learners turning dead time into brain gains',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Main CTA Button
              FadeTransition(
                opacity: _textFadeAnimation,
                child: SizedBox(
                  width: screenSize.width * 0.7,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleStartLearning,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor: Theme.of(
                        context,
                      ).colorScheme.onSecondary,
                      elevation: 8,
                      shadowColor: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          )
                        : Text(
                            'Start Learning Now',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSecondary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Micro-copy
              FadeTransition(
                opacity: _textFadeAnimation,
                child: Text(
                  'No signup required • Works with any audio • 30 seconds to first win',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(),
            ],
          ),
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

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.message),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      },
      (user) {
        setState(() {
          _isLoading = false;
        });

        context.go('/home');
      },
    );
  }
}
