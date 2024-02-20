import 'package:flutter/material.dart';

class GalleryItemData {
  const GalleryItemData({
    required this.id,
    required this.name,
    required this.seedColor,
  });

  final String id;
  final String name;
  final Color seedColor;
}

class MyFlutterGalleryData {
  const MyFlutterGalleryData({
    this.selectedItem,
    this.items = const [],
  });

  final GalleryItemData? selectedItem;
  final List<GalleryItemData> items;

  MyFlutterGalleryData copyWith({
    GalleryItemData? selectedItem,
    List<GalleryItemData>? items,
  }) {
    return MyFlutterGalleryData(
      selectedItem: selectedItem ?? this.selectedItem,
      items: items ?? this.items,
    );
  }
}
