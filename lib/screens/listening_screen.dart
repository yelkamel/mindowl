import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _waveController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _waveAnimation;

  bool _isListening = true;
  String _detectedContext = "Podcast audio detected";
  int _sessionTimer = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Pulse animation for microphone
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    // Wave animation for sound visualization
    _waveController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat();

    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _waveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.easeInOut),
    );

    // Start session timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _sessionTimer++;
      });

      // Simulate question after 15 seconds
      if (_sessionTimer == 15) {
        _showQuestion();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _showQuestion() {
    _timer.cancel();
    context.push('/exo').then((_) {
      // Restart the timer when returning from exo
      if (mounted && _isListening) {
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            _sessionTimer++;
          });

          // Simulate next question after another 15 seconds
          if (_sessionTimer % 15 == 0) {
            _showQuestion();
          }
        });
      }
    });
  }

  void _endSession() {
    _timer.cancel();
    _pulseController.stop();
    _waveController.stop();
    
    // Navigate to session results
    context.pushReplacement('/session-results');
  }

  void _pauseSession() {
    setState(() {
      _isListening = false;
    });
    _timer.cancel();
    _pulseController.stop();
    _waveController.stop();
  }

  void _resumeSession() {
    setState(() {
      _isListening = true;
    });
    _pulseController.repeat(reverse: true);
    _waveController.repeat();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _sessionTimer++;
      });
    });
  }

  String get _formattedTime {
    final minutes = (_sessionTimer ~/ 60).toString().padLeft(2, '0');
    final seconds = (_sessionTimer % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header with back button (only show if not actively listening)
              if (!_isListening)
                Row(
                  children: [
                    IconButton(
                      icon: const HeroIcon(HeroIcons.arrowLeft),
                      onPressed: () => context.pop(),
                    ),
                    const Spacer(),
                  ],
                ),

              const Spacer(flex: 2),

              // Pulsing Microphone with Sound Waves
              AnimatedBuilder(
                animation: Listenable.merge([_pulseAnimation, _waveAnimation]),
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer wave rings
                      if (_isListening) ...[
                        for (int i = 0; i < 3; i++)
                          Container(
                            width: 200 + (i * 40),
                            height: 200 + (i * 40),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.secondary
                                    .withOpacity(0.3 - (i * 0.1)),
                                width: 2,
                              ),
                            ),
                          ),
                      ],

                      // Main microphone container
                      Transform.scale(
                        scale: _isListening ? _pulseAnimation.value : 1.0,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                Theme.of(
                                  context,
                                ).colorScheme.primary.withOpacity(0.8),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withOpacity(0.3),
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: HeroIcon(
                            _isListening
                                ? HeroIcons.microphone
                                : HeroIcons.pause,
                            size: 80,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 40),

              // Status Text
              Text(
                _isListening ? 'Listening to your world...' : 'Session Paused',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: _isListening
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Context Awareness
              if (_isListening)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.tertiary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.tertiary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeroIcon(
                        HeroIcons.speakerWave,
                        size: 16,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _detectedContext,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

              const Spacer(),

              // Session Info
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Time',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withOpacity(0.6),
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formattedTime,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        Column(
                          children: [
                            Text(
                              'Next Question',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withOpacity(0.6),
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _sessionTimer < 15
                                  ? '${15 - _sessionTimer}s'
                                  : 'Ready!',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    if (_sessionTimer >= 10)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'Question incoming...',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Control Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: _isListening ? _pauseSession : _resumeSession,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isListening
                              ? Theme.of(context).colorScheme.outline
                              : Theme.of(context).colorScheme.secondary,
                          foregroundColor: _isListening
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context).colorScheme.onSecondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: HeroIcon(
                          _isListening ? HeroIcons.pause : HeroIcons.play,
                          size: 20,
                        ),
                        label: Text(
                          _isListening ? 'Pause' : 'Resume',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton.icon(
                        onPressed: _endSession,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: HeroIcon(
                          HeroIcons.stop,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'End Session',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
