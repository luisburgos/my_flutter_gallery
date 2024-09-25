import 'package:flutter/material.dart';

class GalleryItemData {
  const GalleryItemData({
    required this.id,
    required this.name,
    required this.description,
    required this.seedColor,
    required this.iconData,
    required this.pageBuilder,
  });

  final String id;
  final String name;
  final String description;
  final Color seedColor;
  final Icon iconData;
  final Widget Function(BuildContext context) pageBuilder;
}

class MyFlutterGalleryData {
  const MyFlutterGalleryData({
    this.items = const [],
  });

  final List<GalleryItemData> items;

  MyFlutterGalleryData copyWith({
    List<GalleryItemData>? items,
  }) {
    return MyFlutterGalleryData(
      items: items ?? this.items,
    );
  }
}
