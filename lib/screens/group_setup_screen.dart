import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class GroupSetupScreen extends StatefulWidget {
  const GroupSetupScreen({super.key});

  @override
  State<GroupSetupScreen> createState() => _GroupSetupScreenState();
}

class _GroupSetupScreenState extends State<GroupSetupScreen>
    with TickerProviderStateMixin {
  late AnimationController _avatarController;
  late Animation<double> _avatarAnimation;

  String _roomCode = 'LEARN42';
  List<Player> _players = [
    Player(name: 'You', avatar: '🦉', isReady: true, isHost: true),
  ];
  bool _allReady = false;

  @override
  void initState() {
    super.initState();

    _avatarController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _avatarAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _avatarController, curve: Curves.easeInOut),
    );

    // Simulate players joining
    _simulatePlayersJoining();
  }

  @override
  void dispose() {
    _avatarController.dispose();
    super.dispose();
  }

  void _simulatePlayersJoining() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _players.add(Player(name: 'Alex', avatar: '🧠', isReady: false));
        });
      }
    });

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _players.add(Player(name: 'Sam', avatar: '⚡', isReady: false));
        });
      }
    });

    Future.delayed(const Duration(seconds: 6), () {
      if (mounted) {
        setState(() {
          _players[1] = _players[1].copyWith(isReady: true);
          _checkAllReady();
        });
      }
    });
  }

  void _checkAllReady() {
    final allReady = _players.every((player) => player.isReady);
    setState(() {
      _allReady = allReady;
    });
  }

  void _startSession() {
    context.push('/group-listening');
  }

  void _leaveRoom() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave Room?'),
        content: const Text(
          'Are you sure you want to leave this learning session?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop();
            },
            child: const Text('Leave'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const HeroIcon(HeroIcons.arrowLeft),
          onPressed: _leaveRoom,
        ),
        title: Text(
          'Learning Lobby',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Room Code Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Room Code',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _roomCode,
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 4,
                              ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () {
                            // Copy to clipboard logic
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Room code copied!'),
                              ),
                            );
                          },
                          icon: const HeroIcon(
                            HeroIcons.clipboard,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Players Section
              Text(
                'Players (${_players.length}/4)',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 16),

              // Player Avatars
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: 4, // Max 4 players
                  itemBuilder: (context, index) {
                    if (index < _players.length) {
                      return _buildPlayerCard(_players[index]);
                    } else {
                      return _buildEmptyPlayerSlot();
                    }
                  },
                ),
              ),

              // Audio Test Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    HeroIcon(
                      HeroIcons.speakerWave,
                      size: 24,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Everyone hearing the same thing?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Test Audio',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Start Button (Host Only)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _allReady && _players.length >= 2
                      ? _startSession
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _allReady && _players.length >= 2
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outline,
                    foregroundColor: _allReady && _players.length >= 2
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: HeroIcon(
                    _allReady && _players.length >= 2
                        ? HeroIcons.play
                        : HeroIcons.clock,
                    size: 20,
                  ),
                  label: Text(
                    _allReady && _players.length >= 2
                        ? 'Start Learning Session'
                        : 'Waiting for players...',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerCard(Player player) {
    return AnimatedBuilder(
      animation: _avatarAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: player.isReady ? _avatarAnimation.value : 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: player.isReady
                  ? Theme.of(context).colorScheme.tertiary.withOpacity(0.1)
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: player.isReady
                    ? Theme.of(context).colorScheme.tertiary
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      player.avatar,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  player.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (player.isHost)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'HOST',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: player.isReady
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          player.isReady ? 'READY' : 'NOT READY',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyPlayerSlot() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroIcon(
            HeroIcons.userPlus,
            size: 32,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          const SizedBox(height: 8),
          Text(
            'Waiting...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class Player {
  final String name;
  final String avatar;
  final bool isReady;
  final bool isHost;

  Player({
    required this.name,
    required this.avatar,
    this.isReady = false,
    this.isHost = false,
  });

  Player copyWith({String? name, String? avatar, bool? isReady, bool? isHost}) {
    return Player(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      isReady: isReady ?? this.isReady,
      isHost: isHost ?? this.isHost,
    );
  }
}
