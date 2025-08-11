import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class AnimatedMicrophone extends StatefulWidget {
  final bool isListening;
  final double size;
  final VoidCallback? onTap;

  const AnimatedMicrophone({
    super.key,
    required this.isListening,
    this.size = 160,
    this.onTap,
  });

  @override
  State<AnimatedMicrophone> createState() => _AnimatedMicrophoneState();
}

class _AnimatedMicrophoneState extends State<AnimatedMicrophone>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _waveController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _waveController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _updateAnimations();
  }

  @override
  void didUpdateWidget(AnimatedMicrophone oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isListening != widget.isListening) {
      _updateAnimations();
    }
  }

  void _updateAnimations() {
    if (widget.isListening) {
      _pulseController.repeat(reverse: true);
      _waveController.repeat();
    } else {
      _pulseController.stop();
      _waveController.stop();
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: Listenable.merge([_pulseAnimation, _waveController]),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Outer wave rings
              if (widget.isListening) ...[
                for (int i = 0; i < 3; i++)
                  Container(
                    width: widget.size + 40 + (i * 40),
                    height: widget.size + 40 + (i * 40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.3 - (i * 0.1)),
                        width: 2,
                      ),
                    ),
                  ),
              ],
              
              // Main microphone container
              Transform.scale(
                scale: widget.isListening ? _pulseAnimation.value : 1.0,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.3),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: HeroIcon(
                    widget.isListening ? HeroIcons.microphone : HeroIcons.pause,
                    size: widget.size * 0.5,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}