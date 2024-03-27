import 'package:flutter/material.dart';

class GalleryItemData {
  const GalleryItemData({
    required this.id,
    required this.name,
    required this.seedColor,
    required this.iconData,
    required this.pageBuilder,
  });

  final String id;
  final String name;
  final Color seedColor;
  final Icon iconData;
  final Widget Function(BuildContext context) pageBuilder;
}

enum DisplayMode {
  grid,
  list;

  bool get isGrid => this == DisplayMode.grid;
}

class MyFlutterGalleryData {
  const MyFlutterGalleryData({
    this.selectedItem,
    this.items = const [],
    this.displayMode = DisplayMode.list,
  });

  final GalleryItemData? selectedItem;
  final List<GalleryItemData> items;
  final DisplayMode displayMode;

  MyFlutterGalleryData copyWith({
    GalleryItemData? selectedItem,
    List<GalleryItemData>? items,
    DisplayMode? displayMode,
  }) {
    return MyFlutterGalleryData(
      selectedItem: selectedItem ?? this.selectedItem,
      items: items ?? this.items,
      displayMode: displayMode ?? this.displayMode,
    );
  }
}
