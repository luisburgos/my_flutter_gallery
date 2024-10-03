import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemsResponsiveView extends StatelessWidget {
  const GalleryItemsResponsiveView({
    required this.items,
    required this.onItemTap,
    this.padding,
    super.key,
  });

  final List<GalleryItemData> items;
  final void Function(GalleryItemData) onItemTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = _calculateCrossAxisCount(context);
    final (columnSizes, rowSizes) = _getSizes(crossAxisCount);
    final (rowGap, columGap) = _getGaps(crossAxisCount);
    return SingleChildScrollView(
      child: LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        columnGap: columGap,
        rowGap: rowGap,
        children: [
          for (var i = 0; i < items.length; i++)
            GalleryItemView(
              margin: EdgeInsets.zero,
              item: items[i],
              onItemTap: onItemTap,
              mode: crossAxisCount == 1
                  ? GalleryItemViewMode.tile
                  : GalleryItemViewMode.card,
            ),
        ],
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    final breakpoints = ShadTheme.of(context).breakpoints;
    if (context.breakpoint <= breakpoints.tn) {
      return 1;
    } else if (context.breakpoint <= breakpoints.sm) {
      return 2;
    } else {
      return 3;
    }
  }

  (double, double) _getGaps(int crossAxisCount) {
    if (crossAxisCount == 1) return (18, 0);
    return (24, 24);
  }

  (List<FlexibleTrackSize>, List<IntrinsicContentTrackSize>) _getSizes(
    int crossAxisCount,
  ) {
    var columnSizes = <FlexibleTrackSize>[];
    for (var i = 0; i < crossAxisCount; i++) {
      columnSizes = [...columnSizes, 1.fr];
    }

    var rowSizes = <IntrinsicContentTrackSize>[];
    for (var i = 0; i < items.length / crossAxisCount; i++) {
      rowSizes = [...rowSizes, auto];
    }
    return (columnSizes, rowSizes);
  }
}
