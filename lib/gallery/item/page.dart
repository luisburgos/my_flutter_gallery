import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/state.dart';

class GalleryItemHomePage extends StatelessWidget {
  const GalleryItemHomePage({
    required this.itemId,
    super.key,
  });

  final String? itemId;

  @override
  Widget build(BuildContext context) {
    final state = GalleryItemsState.of(context);
    final find = state.items.where((app) => app.id == itemId).firstOrNull;
    if (find != null) {
      return find.pageBuilder(context);
    }
    return const UnimplementedGalleryItemPage();
  }
}

class UnimplementedGalleryItemPage extends StatelessWidget {
  const UnimplementedGalleryItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Unimplemented item'),
      ),
    );
  }
}
