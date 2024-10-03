import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/state.dart';
import 'package:my_flutter_gallery/gallery/widgets/gallery_items.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GalleryItemsState.of(context);
    final apps = state.items.reversed.toList();

    return GalleryItemsResponsiveView(
      padding: EdgeInsets.zero,
      items: apps,
      onItemTap: (_) {
        context.navigateToGalleryItem(_.id);
      },
    );
  }
}
