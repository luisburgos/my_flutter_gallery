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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WireframeArtLine(
            color: colors.filColor1,
            height: wireframeArtHeightUnit * 2,
            width: 30,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              _buildItem(),
              const SizedBox(width: 4),
              _buildItem(),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 8),
          WireframeArtLine(
            color: colors.filColor1,
            height: wireframeArtHeightUnit * 2,
            width: 30,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              _buildItem(),
              const SizedBox(width: 4),
              _buildItem(),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              _buildItem(useAccent: true),
              const SizedBox(width: 4),
              _buildItem(),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem({bool useAccent = false}) => WireframeArtSquare(
        height: wireframeArtHeightUnit * 9,
        width: wireframeArtHeightUnit * 11.5,
        color: useAccent ? colors.accentColor : colors.filColor1,
        radius: 5,
      );
}
