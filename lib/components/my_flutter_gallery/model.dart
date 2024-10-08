import 'package:flutter/material.dart';
import 'package:lowframer/lowframer.dart';

enum GalleryItemType {
  component,
  feature;

  bool get isComponent => this == GalleryItemType.component;
}

typedef CoverBuilder = Widget Function(ArtColors);

class GalleryItemData {
  const GalleryItemData({
    required this.id,
    required this.name,
    required this.description,
    required this.seedColor,
    required this.iconData,
    required this.pageBuilder,
    required this.type,
    this.coverBuilder,
    this.githubRepoUrl,
  });

  final String id;
  final String name;
  final String description;
  final String? githubRepoUrl;
  final GalleryItemType type;
  final Color seedColor;
  final Icon iconData;
  final CoverBuilder? coverBuilder;
  final Widget Function(BuildContext context) pageBuilder;
}
