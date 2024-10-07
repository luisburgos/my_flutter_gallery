import 'package:flutter/material.dart';

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

class ArtColors {
  const ArtColors({
    required this.accentColor,
    required this.backgroundColor,
    required this.filColor0,
    required this.filColor1,
    required this.filColor2,
  });

  final Color accentColor;
  final Color backgroundColor;
  final Color filColor0;
  final Color filColor1;
  final Color filColor2;

  ArtColors copyWith({
    Color? accentColor,
    Color? backgroundColor,
    Color? filColor0,
    Color? filColor1,
    Color? filColor2,
  }) {
    return ArtColors(
      accentColor: accentColor ?? this.accentColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      filColor0: filColor0 ?? this.filColor0,
      filColor1: filColor1 ?? this.filColor1,
      filColor2: filColor2 ?? this.filColor2,
    );
  }
}
