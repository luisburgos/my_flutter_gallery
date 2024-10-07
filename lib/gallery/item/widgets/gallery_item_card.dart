import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_brief.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_cover.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemCard extends StatelessWidget {
  const GalleryItemCard({
    required this.item,
    this.borderRadius,
    this.displayDecoration = false,
    super.key,
  });

  final GalleryItemData item;
  final BorderRadius? borderRadius;
  final bool displayDecoration;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      radius: borderRadius,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GalleryItemCover(
            icon: item.iconData,
            iconColor: item.seedColor,
            width: double.infinity,
            height: galleryItemCoverHeight,
            coverBuilder: item.coverBuilder,
            displayDecoration: displayDecoration,
          ),
          GalleryItemBrief(
            name: item.name,
            description: item.description,
            padding: const EdgeInsets.only(
              right: 24,
              left: 24,
              bottom: 24,
            ),
          ),
        ],
      ),
    );
  }
}
