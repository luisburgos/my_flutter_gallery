import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemsGrid extends StatelessWidget {
  const GalleryItemsGrid({
    required this.items,
    required this.onItemTap,
    super.key,
  });

  final List<GalleryItemData> items;
  final void Function(GalleryItemData) onItemTap;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = _calculateCrossAxisCount(context);
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GalleryItemCard(
                item: item,
                onItemTap: onItemTap,
                mode: crossAxisCount != 1
                    ? GalleryItemCardMode.rectangle
                    : GalleryItemCardMode.square,
              );
            },
          ),
        ),
      ],
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    return switch (context.breakpoint) {
      ShadBreakpointTN() => 1,
      ShadBreakpointSM() => 2,
      ShadBreakpointMD() => 3,
      ShadBreakpointLG() => 3,
      ShadBreakpointXL() => 3,
      ShadBreakpointXXL() => 3,
    };
  }
}
