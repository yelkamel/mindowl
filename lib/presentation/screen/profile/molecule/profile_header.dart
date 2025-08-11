import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:layou_tools/layou_tools.dart';

class ProfileHeader extends StatefulWidget {
  final String avatarUrl;
  final String userName;
  final String userBio;
  final int memberSince;
  final Function() onEditAvatar;
  final Function(String) onNameChanged;
  final Function(String) onBioChanged;

  const ProfileHeader({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.userBio,
    required this.memberSince,
    required this.onEditAvatar,
    required this.onNameChanged,
    required this.onBioChanged,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  bool _isEditingName = false;
  bool _isEditingBio = false;

  @override
  void initState() {
    super.initState();
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _nameController = TextEditingController(text: widget.userName);
    _bioController = TextEditingController(text: widget.userBio);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _saveName() {
    widget.onNameChanged(_nameController.text);
    setState(() => _isEditingName = false);
  }

  void _saveBio() {
    widget.onBioChanged(_bioController.text);
    setState(() => _isEditingBio = false);
  }

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildAvatarEditor(),
            const SizedBox(height: 16),
            _buildNameField(),
            const SizedBox(height: 8),
            _buildMemberBadge(),
            const SizedBox(height: 16),
            _buildBioSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarEditor() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: GestureDetector(
            onTap: widget.onEditAvatar,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipOval(
                    child: Image.asset(
                      widget.avatarUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 2,
                        ),
                      ),
                      child: const HeroIcon(
                        HeroIcons.camera,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNameField() {
    if (_isEditingName) {
      return TextField(
        controller: _nameController,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
        ),
        onSubmitted: (_) => _saveName(),
        autofocus: true,
      );
    }

    return GestureDetector(
      onTap: () => setState(() => _isEditingName = true),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.userName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 8),
          HeroIcon(
            HeroIcons.pencil,
            size: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeroIcon(
            HeroIcons.trophy,
            size: 16,
            color: Colors.orange,
          ),
          const SizedBox(width: 6),
          Text(
            'Learning since ${widget.memberSince} days',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection() {
    if (_isEditingBio) {
      return TextField(
        controller: _bioController,
        maxLines: 3,
        maxLength: 150,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Your learning journey...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
        ),
        onSubmitted: (_) => _saveBio(),
      );
    }

    return GestureDetector(
      onTap: () => setState(() => _isEditingBio = true),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              widget.userBio,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            HeroIcon(
              HeroIcons.pencil,
              size: 14,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}