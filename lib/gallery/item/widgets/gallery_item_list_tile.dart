import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_brief.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_cover.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_type.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemListTile extends StatelessWidget {
  const GalleryItemListTile({
    required this.item,
    this.borderRadius,
    super.key,
  });

  final GalleryItemData item;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      radius: borderRadius,
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      height: itemCardHeight,
      child: Column(
        children: [
          GalleryItemCover(
            icon: item.iconData,
            iconColor: item.seedColor,
            width: 200,
            height: itemCardHeight / 2.5,
            margin: const EdgeInsets.all(10),
            coverBuilder: item.coverBuilder,
          ),
          GalleryItemNameText(item.name),
          const SizedBox(height: 4),
          GalleryItemTypeChip(
            type: item.type,
          ),
          const SizedBox(height: 10),
          GalleryItemDescriptionText(
            item.description,
          ),
        ],
      ),
    );
  }
}
