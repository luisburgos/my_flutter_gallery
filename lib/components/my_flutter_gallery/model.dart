import 'package:flutter/material.dart';

class GalleryItemData {
  const GalleryItemData({
    required this.id,
    required this.name,
    required this.description,
    required this.seedColor,
    required this.iconData,
    required this.pageBuilder,
    this.githubRepoUrl,
  });

  final String id;
  final String name;
  final String description;
  final String? githubRepoUrl;
  final Color seedColor;
  final Icon iconData;
  final Widget Function(BuildContext context) pageBuilder;
}
