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

    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      body: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Column(
          children: [
            GameScoreHeader(),
            SizedBox(height: 10),
            Expanded(
              child: GameScoreBody(),
            ),
          ],
        ),
      ),
    );
  }
}

/// @no-doc
class GameScoreBody extends ConsumerWidget {
  /// @no-doc
  const GameScoreBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameScore = ref.watch(gameScoreCounterNotifierProvider);

    return Row(
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
    );
  }
}

/// @no-doc
class GameScoreHeader extends ConsumerWidget {
  /// @no-doc
  const GameScoreHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameScore = ref.watch(gameScoreCounterNotifierProvider);

    return Row(
      children: [
        _teamNameLabel(gameScore.teamNameRed),
        const Spacer(),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          onPressed: () => _onResetTap(ref),
          child: Icon(
            FontAwesomeIcons.arrowRotateRight,
            size: 20,
            color: Colors.grey.shade900,
          ),
        ),
        const Spacer(),
        _teamNameLabel(gameScore.teamNameBlue),
      ],
    );
  }

  Widget _teamNameLabel(String name) => Text(
        'TEAM $name'.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 14,
        ),
      );

  void _onResetTap(WidgetRef ref) {
    ref.read(gameScoreCounterNotifierProvider.notifier).resetGame();
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onIncreaseTap,
                    icon: const Icon(
                      FontAwesomeIcons.chevronUp,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '$score',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: onIncreaseTap,
                    icon: const Icon(
                      FontAwesomeIcons.chevronDown,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
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
    this.teamNameRed = 'Red',
    this.teamNameBlue = 'Blue',
    this.teamScoreRed = 0,
    this.teamScoreBlue = 0,
  });

  /// @no-doc
  final String teamNameRed;

  /// @no-doc
  final String teamNameBlue;

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
