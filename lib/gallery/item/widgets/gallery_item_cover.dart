import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum GalleryItemCoverMode {
  square,
  rectangle;

  bool get isSquare => this == GalleryItemCoverMode.square;
}

class GalleryItemCover extends StatelessWidget {
  const GalleryItemCover({
    required this.icon,
    this.mode = GalleryItemCoverMode.rectangle,
    super.key,
  });

  final GalleryItemCoverMode mode;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final color = ShadTheme.of(context).colorScheme.secondary;
    final iconColor = ShadTheme.of(context).colorScheme.primary;

    final isSquareMode = mode.isSquare;
    final height = isSquareMode ? 100.0 : 140.0;
    final width = isSquareMode ? 100.0 : itemCardWidth;

    final borderRadius = isSquareMode
        ? BorderRadius.circular(8)
        : const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          );

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icon.icon,
          color: iconColor,
          size: 24,
        ),
      ),
    );
  }
}
