import 'package:flutter/material.dart';

enum GalleryItemType {
  component,
  feature;

  bool get isComponent => this == GalleryItemType.component;
}

class GalleryItemData {
  const GalleryItemData({
    required this.id,
    required this.name,
    required this.description,
    required this.seedColor,
    required this.iconData,
    required this.pageBuilder,
    required this.type,
    this.githubRepoUrl,
  });

  final String id;
  final String name;
  final String description;
  final String? githubRepoUrl;
  final GalleryItemType type;
  final Color seedColor;
  final Icon iconData;
  final Widget Function(BuildContext context) pageBuilder;
}
