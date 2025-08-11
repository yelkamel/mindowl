import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class ModeSelectionScreen extends StatefulWidget {
  const ModeSelectionScreen({super.key});

  @override
  State<ModeSelectionScreen> createState() => _ModeSelectionScreenState();
}

class _ModeSelectionScreenState extends State<ModeSelectionScreen>
    with TickerProviderStateMixin {
  late AnimationController _soloAnimationController;
  late AnimationController _groupAnimationController;
  late Animation<double> _soloScaleAnimation;
  late Animation<double> _groupScaleAnimation;
  
  int? _selectedMode; // 0 for solo, 1 for group
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    
    // Solo card animation
    _soloAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    // Group card animation
    _groupAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _soloScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _soloAnimationController,
      curve: Curves.easeInOut,
    ));
    
    _groupScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _groupAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _soloAnimationController.dispose();
    _groupAnimationController.dispose();
    super.dispose();
  }

  void _selectMode(int mode) {
    setState(() {
      _selectedMode = mode;
      _isExpanded = true;
    });
    
    // Add slight delay before navigation for better UX
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        if (mode == 0) {
          // Solo mode - go directly to listening
          context.push('/listening');
        } else {
          // Group mode - go to group setup
          context.push('/group-setup');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const HeroIcon(HeroIcons.arrowLeft),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Choose Your Mode',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // Header text
              Text(
                'Select your learning experience',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 40),
              
              // Solo Mode Card
              AnimatedBuilder(
                animation: _soloScaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _selectedMode == 0 ? 1.05 : _soloScaleAnimation.value,
                    child: _buildModeCard(
                      context,
                      mode: 0,
                      title: 'Solo Mission',
                      subtitle: 'Focus Mode',
                      description: 'Master your mind with personalized learning',
                      detailDescription: 'Perfect for podcasts, lectures, training sessions. Learn at your own pace with instant feedback.',
                      icon: HeroIcons.userCircle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.tertiary,
                          Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
                        ],
                      ),
                      isSelected: _selectedMode == 0,
                      onTap: () => _selectMode(0),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 24),
              
              // Group Mode Card
              AnimatedBuilder(
                animation: _groupScaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _selectedMode == 1 ? 1.05 : _groupScaleAnimation.value,
                    child: _buildModeCard(
                      context,
                      mode: 1,
                      title: 'Battle Mode',
                      subtitle: 'Group Challenge',
                      description: 'Challenge friends and learn together',
                      detailDescription: 'Compete with friends in real-time. Share audio sessions and see who learns faster.',
                      icon: HeroIcons.userGroup,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                        ],
                      ),
                      isSelected: _selectedMode == 1,
                      onTap: () => _selectMode(1),
                      socialElement: '3 friends are playing now',
                    ),
                  );
                },
              ),
              
              const Spacer(),
              
              // Bottom hint
              if (_selectedMode == null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      HeroIcon(
                        HeroIcons.lightBulb,
                        size: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Tap any mode to see a preview of the experience',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              
              if (_selectedMode != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Preparing your session...',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModeCard(
    BuildContext context, {
    required int mode,
    required String title,
    required String subtitle,
    required String description,
    required String detailDescription,
    required HeroIcons icon,
    required Gradient gradient,
    required bool isSelected,
    required VoidCallback onTap,
    String? socialElement,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      height: isSelected ? 200 : 160,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withOpacity(0.3),
            blurRadius: isSelected ? 25 : 15,
            offset: Offset(0, isSelected ? 12 : 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isSelected ? null : onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: HeroIcon(
                        icon,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const HeroIcon(
                          HeroIcons.check,
                          size: 20,
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    height: 1.4,
                  ),
                ),
                
                if (isSelected) ...[
                  const SizedBox(height: 12),
                  Text(
                    detailDescription,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      height: 1.3,
                    ),
                  ),
                ],
                
                if (socialElement != null && !isSelected)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        HeroIcon(
                          HeroIcons.users,
                          size: 16,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          socialElement,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Add these route handlers to main.dart
// GoRoute(
//   path: '/listening',
//   builder: (context, state) => const ListeningScreen(),
// ),
// GoRoute(
//   path: '/group-setup',
//   builder: (context, state) => const GroupSetupScreen(),
// ),