import 'package:flutter/material.dart';
import 'package:lowframer/src/lowframer.dart';

class ExperimentalItemCover extends StatelessWidget {
  const ExperimentalItemCover({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      colors: colors,
      child: Column(
        children: [
          WireframeArtTopBar1(
            leading: WireframeArtHomeIcon(
              color: colors.filColor1,
            ),
            trailing: WireframeArtCircle(
              color: colors.filColor1,
            ),
          ),
          Expanded(
            child: WireframeArtGrid1By2(
              color: colors.filColor1,
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightsDailyReviewArt extends StatelessWidget {
  const HighlightsDailyReviewArt({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      colors: colors,
      isMobile: true,
      padding: const EdgeInsets.symmetric(
        horizontal: wireframeArtPaddingUnit / 2,
        vertical: wireframeArtPaddingUnit,
      ),
      child: Row(
        children: [
          WireframeArtIconLeft(colors: colors),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 8),
                WireframeArtSquare(
                  color: colors.filColor1,
                  padding: EdgeInsets.zero,
                  radius: wireframeArtRadius1 / 2,
                  height: wireframeArtHeightUnit * 30,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WireframeArtSquare.small(
                      color: colors.filColor1,
                    ),
                    WireframeArtSquare.small(
                      color: colors.filColor1,
                    ),
                    WireframeArtSquare.small(
                      color: colors.accentColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          WireframeArtIconRight(colors: colors),
        ],
      ),
    );
  }
}

class BillSplitCalculatorArt extends StatelessWidget {
  const BillSplitCalculatorArt({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      colors: colors,
      isMobile: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WireframeArtLine(
            color: colors.filColor1,
            height: wireframeArtHeightUnit * 2,
            width: 30,
          ),
          const SizedBox(height: 4),
          WireframeArtLine(
            color: colors.filColor1,
            height: wireframeArtHeightUnit * 6,
            width: double.infinity,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WireframeArtSquare.small(
                color: colors.filColor1,
              ),
              WireframeArtSquare.small(
                color: colors.accentColor,
              ),
              WireframeArtSquare.small(
                color: colors.filColor1,
              ),
              WireframeArtSquare.small(
                color: colors.filColor1,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: WireframeArtSquare(
              color: colors.filColor1,
              radius: 4,
            ),
          ),
        ],
      ),
    );
  }
}

class WeeklyHabitsTrackerArt extends StatelessWidget {
  const WeeklyHabitsTrackerArt({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      colors: colors,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: wireframeArtPaddingUnit * 2,
        ),
        child: Column(
          children: [
            WireframeArtTopBarBase(
              leading: WireframeArtIconLeft(colors: colors),
              body: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: wireframeArtPaddingUnit * 4,
                  ),
                  child: WireframeArtSquare(
                    color: colors.filColor1,
                    height: wireframeArtHeightUnit * 4,
                    radius: wireframeArtRadius1 / 2,
                  ),
                ),
              ),
              trailing: WireframeArtIconRight(colors: colors),
            ),
            Expanded(
              child: WireframeArtCirclesGrid(
                colors: colors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AiPoweredAppBuilder extends StatelessWidget {
  const AiPoweredAppBuilder({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      colors: colors,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          WireframeArtSquare(
            color: colors.filColor0,
            width: 20,
            radius: wireframeArtRadius1 / 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: wireframeArtPaddingUnit * 1.4,
                vertical: wireframeArtPaddingUnit,
              ),
              child: Column(
                children: [
                  WireframeArtTopBar1(
                    leading: const SizedBox.shrink(),
                    trailing: Row(
                      children: [
                        WireframeArtCircle(
                          color: colors.filColor1,
                        ),
                        const SizedBox(width: 4),
                        WireframeArtCircle(
                          color: colors.accentColor,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: WireframeArtGrid1By2(
                      color: colors.filColor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
