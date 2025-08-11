import 'package:flutter/material.dart';
import 'organism/exo_content.dart';

class ExoScreen extends StatelessWidget {
  const ExoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ExoContent(),
      ),
    );
  }
}