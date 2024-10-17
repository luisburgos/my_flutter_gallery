import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// @no-doc
final gameScoreCounterNotifierProvider =
    StateNotifierProvider<GameScoreCounterController, GameScoreCounterState>(
  (ref) {
    return GameScoreCounterController();
  },
);

/// @no-doc
class GameScoreCounterWidget extends ConsumerWidget {
  /// @no-doc
  const GameScoreCounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameScore = ref.watch(gameScoreCounterNotifierProvider);

    return Column(
      children: [
        Expanded(
          child: TeamScoreView(
            backgroundColor: Colors.redAccent.withOpacity(0.5),
            score: gameScore.teamScoreRed,
            onIncreaseTap: () {
              ref
                  .read(gameScoreCounterNotifierProvider.notifier)
                  .increaseTeamScoreRed();
            },
            onReduceTap: () {
              ref
                  .read(gameScoreCounterNotifierProvider.notifier)
                  .reduceTeamScoreRed();
            },
          ),
        ),
        const Divider(
          height: 10,
          color: Colors.white,
        ),
        Expanded(
          child: TeamScoreView(
            backgroundColor: Colors.blueAccent.withOpacity(0.5),
            score: gameScore.teamScoreBlue,
            onIncreaseTap: () {
              ref
                  .read(gameScoreCounterNotifierProvider.notifier)
                  .increaseTeamScoreBlue();
            },
            onReduceTap: () {
              ref
                  .read(gameScoreCounterNotifierProvider.notifier)
                  .reduceTeamScoreBlue();
            },
          ),
        ),
      ],
    );
  }
}

/// @no-doc
class TeamScoreView extends StatelessWidget {
  /// @no-doc
  const TeamScoreView({
    required this.backgroundColor,
    required this.score,
    required this.onIncreaseTap,
    required this.onReduceTap,
    super.key,
  });

  /// @no-doc
  final Color backgroundColor;

  /// @no-doc
  final int score;

  /// @no-doc
  final VoidCallback onIncreaseTap;

  /// @no-doc
  final VoidCallback onReduceTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '$score',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.outlined(
                    onPressed: onReduceTap,
                    icon: const Icon(
                      FontAwesomeIcons.minus,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.outlined(
                    onPressed: onIncreaseTap,
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      size: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// @no-doc
class GameScoreCounterState {
  /// @no-doc
  const GameScoreCounterState({
    this.teamScoreRed = 0,
    this.teamScoreBlue = 0,
  });

  /// @no-doc
  final int teamScoreRed;

  /// @no-doc
  final int teamScoreBlue;

  /// @no-doc
  GameScoreCounterState copyWith({
    int? teamScoreRed,
    int? teamScoreBlue,
  }) {
    return GameScoreCounterState(
      teamScoreRed: teamScoreRed ?? this.teamScoreRed,
      teamScoreBlue: teamScoreBlue ?? this.teamScoreBlue,
    );
  }
}

/// @no-doc
class GameScoreCounterController extends StateNotifier<GameScoreCounterState> {
  /// @no-doc
  GameScoreCounterController() : super(const GameScoreCounterState());

  /// @no-doc
  void increaseTeamScoreRed() {
    state = state.copyWith(
      teamScoreRed: state.teamScoreRed + 1,
    );
  }

  /// @no-doc
  void increaseTeamScoreBlue() {
    state = state.copyWith(
      teamScoreBlue: state.teamScoreBlue + 1,
    );
  }

  /// @no-doc
  void reduceTeamScoreRed() {
    if (state.teamScoreRed <= 0) return;
    state = state.copyWith(
      teamScoreRed: state.teamScoreRed - 1,
    );
  }

  /// @no-doc
  void reduceTeamScoreBlue() {
    if (state.teamScoreBlue <= 0) return;
    state = state.copyWith(
      teamScoreBlue: state.teamScoreBlue - 1,
    );
  }
}
