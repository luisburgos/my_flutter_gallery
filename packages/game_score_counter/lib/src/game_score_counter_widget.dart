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
          child: Row(
            children: [
              Expanded(
                child: TeamScoreView(
                  backgroundColor: Colors.redAccent,
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
              const VerticalDivider(
                width: 4,
                color: Colors.white,
              ),
              Expanded(
                child: TeamScoreView(
                  backgroundColor: Colors.blueAccent,
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
          ),
        ),
        const Divider(
          color: Colors.white,
          height: 5,
        ),
        SizedBox(
          height: 40,
          child: ColoredBox(
            color: Colors.grey.shade300,
            child: SizedBox.expand(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      ref
                          .read(gameScoreCounterNotifierProvider.notifier)
                          .resetGame();
                    },
                    child: const Text(
                      'RESET',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
        color: backgroundColor.withOpacity(0.9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                    onPressed: onReduceTap,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.minus,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '$score',
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: onIncreaseTap,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.plus,
                      size: 14,
                      color: Colors.white,
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

  /// @no-doc
  void resetGame() {
    state = state.copyWith(
      teamScoreBlue: 0,
      teamScoreRed: 0,
    );
  }
}
