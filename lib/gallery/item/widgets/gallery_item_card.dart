import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_brief.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_cover.dart';
import 'package:my_flutter_gallery/utils/ui_wrappers.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const itemCardWidth = 350.0;

enum GalleryItemCardMode {
  square,
  rectangle;

  bool get isSquare => this == GalleryItemCardMode.square;
}

class GalleryItemCard extends StatelessWidget {
  const GalleryItemCard({
    required this.item,
    required this.onItemTap,
    this.margin = const EdgeInsets.all(8),
    this.mode = GalleryItemCardMode.rectangle,
    super.key,
  });

  final EdgeInsetsGeometry margin;
  final GalleryItemData item;
  final void Function(GalleryItemData) onItemTap;
  final GalleryItemCardMode mode;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (mode.isSquare) {
      child = GalleryItemCardSquareMode(item: item);
    } else {
      child = GalleryItemCardRectangleMode(item: item);
    }

    return HoverAware(
      builder: (isHovered) {
        return GestureDetector(
          onTap: () => onItemTap(item),
          child: Container(
            margin: margin,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: isHovered ? 7 : 0,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class GalleryItemCardSquareMode extends StatelessWidget {
  const GalleryItemCardSquareMode({
    required this.item,
    super.key,
  });

  final GalleryItemData item;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GalleryItemCover(
            icon: item.iconData,
            mode: GalleryItemCoverMode.square,
          ),
          Expanded(
            child: GalleryItemBrief(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              name: item.name,
              description: item.description,
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryItemCardRectangleMode extends StatelessWidget {
  const GalleryItemCardRectangleMode({
    required this.item,
    super.key,
  });

  final GalleryItemData item;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      width: itemCardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GalleryItemCover(
            icon: item.iconData,
          ),
          GalleryItemBrief(
            name: item.name,
            description: item.description,
          ),
        ],
      ),
    );
  }
}
