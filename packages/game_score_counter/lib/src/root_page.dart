import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class GameScoreCounterRootPage extends StatelessWidget {
  /// @no-doc
  const GameScoreCounterRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: ProviderScope(
            child: Placeholder(
              child: Text('Game Score Counter'),
            ),
          ),
        ),
      ),
    );
  }
}
