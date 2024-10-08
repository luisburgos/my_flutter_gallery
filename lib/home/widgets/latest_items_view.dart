import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/state.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LatestItemsView extends StatelessWidget {
  const LatestItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GalleryItemsState.of(context);
    final apps = state.items;
    final totalApps = state.items.length;

    final subtitleColor = ShadTheme.of(context).colorScheme.mutedForeground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'LATEST BITS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ShadButton.link(
              padding: EdgeInsets.zero,
              onPressed: context.navigateToGallery,
              child: Text(
                'VIEW ALL',
                style: TextStyle(
                  color: subtitleColor.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        GalleryItemView(
          margin: EdgeInsets.zero,
          item: apps[totalApps - 1],
          onItemTap: (_) => context.navigateToGalleryItem(_.id),
          mode: GalleryItemViewMode.card,
        ),
        const SizedBox(height: 14),
        GalleryItemView(
          margin: EdgeInsets.zero,
          item: apps[totalApps - 2],
          onItemTap: (_) => context.navigateToGalleryItem(_.id),
          mode: GalleryItemViewMode.card,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
