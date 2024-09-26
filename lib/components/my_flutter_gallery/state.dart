import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';

class GalleryItemsState extends InheritedWidget {
  const GalleryItemsState({
    required this.items,
    required super.child,
    super.key,
  });

  final List<GalleryItemData> items;

  static GalleryItemsState of(BuildContext context) {
    final state =
        context.dependOnInheritedWidgetOfExactType<GalleryItemsState>();
    if (state == null) {
      throw Exception('MyFlutterGallery not found in the widget tree');
    }
    return state;
  }

  @override
  bool updateShouldNotify(GalleryItemsState oldWidget) {
    return oldWidget.items != items;
  }
}
