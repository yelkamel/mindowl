import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen>
    with TickerProviderStateMixin {
  late AnimationController _keyAnimationController;
  late AnimationController _unlockAnimationController;
  late Animation<double> _keyRotationAnimation;
  late Animation<double> _keyScaleAnimation;
  late Animation<double> _chestScaleAnimation;
  late Animation<double> _fadeAnimation;
  
  bool _isUnlocking = false;

  @override
  void initState() {
    super.initState();
    
    // Key floating animation
    _keyAnimationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    // Unlock sequence animation
    _unlockAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    // Key animations
    _keyRotationAnimation = Tween<double>(
      begin: -0.1,
      end: 0.1,
    ).animate(CurvedAnimation(
      parent: _keyAnimationController,
      curve: Curves.easeInOut,
    ));
    
    _keyScaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _keyAnimationController,
      curve: Curves.easeInOut,
    ));
    
    // Chest unlock animation
    _chestScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _unlockAnimationController,
      curve: Curves.elasticOut,
    ));
    
    // Fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _unlockAnimationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));
  }

  @override
  void dispose() {
    _keyAnimationController.dispose();
    _unlockAnimationController.dispose();
    super.dispose();
  }

  Future<bool> _requestPermission() async {
    setState(() {
      _isUnlocking = true;
    });
    
    await _unlockAnimationController.forward();
    
    try {
      final status = await Permission.microphone.request();
      
      if (mounted) {
        if (status == PermissionStatus.granted) {
          context.go('/home');
          return true;
        } else {
          setState(() {
            _isUnlocking = false;
          });
          _unlockAnimationController.reset();
          return false;
        }
      }
      return false;
    } catch (e) {
      if (mounted) {
        setState(() {
          _isUnlocking = false;
        });
        _unlockAnimationController.reset();
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HeroIcon(
            HeroIcons.arrowLeft,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),
              
              // Key and Treasure Chest Visual Metaphor
              AnimatedBuilder(
                animation: Listenable.merge([
                  _keyAnimationController,
                  _unlockAnimationController,
                ]),
                builder: (context, child) {
                  return Column(
                    children: [
                      // Floating Key
                      Transform.rotate(
                        angle: _keyRotationAnimation.value,
                        child: Transform.scale(
                          scale: _keyScaleAnimation.value,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                                  Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.7, 1.0],
                              ),
                            ),
                            child: HeroIcon(
                              HeroIcons.microphone,
                              size: 50,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Treasure Chest
                      Transform.scale(
                        scale: _chestScaleAnimation.value,
                        child: Container(
                          width: 120,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              HeroIcon(
                                HeroIcons.archiveBox,
                                size: 60,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              if (_isUnlocking)
                                FadeTransition(
                                  opacity: _fadeAnimation,
                                  child: HeroIcon(
                                    HeroIcons.sparkles,
                                    size: 30,
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              
              const SizedBox(height: 50),
              
              // Benefit-First Copy
              Text(
                'Unlock Real-Time Learning',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              Text(
                'Transform any audio into an interactive learning experience',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              // Privacy Reassurance
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeroIcon(
                      HeroIcons.lockClosed,
                      size: 20,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Audio processed, never stored',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Main CTA Button
              SizedBox(
                width: screenSize.width * 0.8,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isUnlocking ? null : _requestPermission,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isUnlocking 
                        ? Theme.of(context).colorScheme.tertiary
                        : Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    elevation: 8,
                    shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: _isUnlocking
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Unlocking...',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'Tap to Unlock',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Skip option (fallback)
              TextButton(
                onPressed: () => context.go('/home'),
                child: Text(
                  'Continue without microphone',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}