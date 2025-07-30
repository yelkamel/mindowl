import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class GroupListeningScreen extends StatefulWidget {
  const GroupListeningScreen({super.key});

  @override
  State<GroupListeningScreen> createState() => _GroupListeningScreenState();
}

class _GroupListeningScreenState extends State<GroupListeningScreen> {
  final List<String> _players = ['You', 'Alex', 'Sam'];
  final List<bool> _playerReady = [true, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const HeroIcon(HeroIcons.arrowLeft),
          onPressed: () => context.pop(),
        ),
        title: const Text('Group Learning'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(
              HeroIcons.userGroup,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Group Listening Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('This screen would show synchronized listening for multiple players'),
          ],
        ),
      ),
    );
  }
}