import 'package:flutter/material.dart';
import 'organism/mode_selection_content.dart';

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ModeSelectionContent(),
      ),
    );
  }
}