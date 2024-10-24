import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_card.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_list_tile.dart';
import 'package:my_flutter_gallery/utils/hover_aware.dart';

const itemCardWidth = 327.0;
const itemCardHeight = 387.0;

enum GalleryItemViewMode {
  card,
  tile;

  bool get isCard => this == GalleryItemViewMode.card;
}

class GalleryItemView extends StatelessWidget {
  const GalleryItemView({
    required this.item,
    required this.onItemTap,
    this.mode = GalleryItemViewMode.tile,
    this.margin = const EdgeInsets.all(8),
    super.key,
  });

  final GalleryItemData item;
  final void Function(GalleryItemData) onItemTap;
  final GalleryItemViewMode mode;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);

    return HoverAware(
      builder: (isHovered) {
        Widget child;
        if (mode.isCard) {
          child = GalleryItemCard(
            item: item,
            borderRadius: borderRadius,
            displayDecoration: isHovered,
          );
        } else {
          child = GalleryItemListTile(
            item: item,
            borderRadius: borderRadius,
          );
        }

        return GestureDetector(
          onTap: () => onItemTap(item),
          child: Container(
            margin: margin,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              clipBehavior: Clip.antiAlias,
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
