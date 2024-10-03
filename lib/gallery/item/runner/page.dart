import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/state.dart';
import 'package:my_flutter_gallery/gallery/item/page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemRunnerPage extends StatelessWidget {
  const GalleryItemRunnerPage({
    required this.itemId,
    super.key,
  });

  final String? itemId;

  @override
  Widget build(BuildContext context) {
    final state = GalleryItemsState.of(context);
    final find = state.items.where((app) => app.id == itemId).firstOrNull;
    if (find != null) {
      return DevicePreview(
        backgroundColor: ShadTheme.of(context).colorScheme.background,
        builder: (_) => SafeArea(
          child: find.pageBuilder(_),
        ),
      );
    }
    return const UnimplementedGalleryItemPage();
  }
}
