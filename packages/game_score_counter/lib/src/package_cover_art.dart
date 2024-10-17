import 'package:flutter/material.dart';
import 'package:lowframer/lowframer.dart';

/// @no-doc
class GameScoreCounterCoverArt extends StatelessWidget {
  /// @no-doc
  const GameScoreCounterCoverArt({
    required this.colors,
    super.key,
  });

  /// @no-doc
  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      colors: colors,
      isMobile: true,
      isLandscape: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                flex: 4,
                child: WireframeArtLine(
                  color: colors.filColor1,
                  height: wireframeArtHeightUnit * 2,
                  width: double.infinity,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 2,
                child: WireframeArtLine(
                  color: colors.filColor1,
                  height: wireframeArtHeightUnit * 2,
                  width: double.infinity,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 4,
                child: WireframeArtLine(
                  color: colors.filColor1,
                  height: wireframeArtHeightUnit * 2,
                  width: double.infinity,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildItem(),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: _buildItem(useAccent: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({bool useAccent = false}) => WireframeArtSquare(
        height: wireframeArtHeightUnit * 20,
        width: wireframeArtHeightUnit * 11.5,
        color: useAccent ? colors.accentColor : colors.filColor1,
        radius: 5,
      );
}
