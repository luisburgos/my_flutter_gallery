import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';

class MyFlutterGalleryState extends InheritedWidget {
  const MyFlutterGalleryState({
    required this.items,
    required super.child,
    super.key,
  });

  final List<GalleryItemData> items;

  static MyFlutterGalleryState of(BuildContext context) {
    final state =
        context.dependOnInheritedWidgetOfExactType<MyFlutterGalleryState>();
    if (state == null) {
      throw Exception('MyFlutterGallery not found in the widget tree');
    }
    return state;
  }

  @override
  bool updateShouldNotify(MyFlutterGalleryState oldWidget) {
    return oldWidget.items != items;
  }
}
