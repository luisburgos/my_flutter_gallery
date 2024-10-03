import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const galleryItemCoverHeight = 178.0;

class GalleryItemCover extends StatelessWidget {
  const GalleryItemCover({
    required this.icon,
    required this.height,
    required this.width,
    this.iconColor,
    this.margin,
    super.key,
  });

  final Icon icon;
  final double height;
  final double width;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        ShadTheme.of(context).colorScheme.secondary.withOpacity(0.9);
    final defaultIconColor = ShadTheme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: margin ?? const EdgeInsets.all(24),
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icon.icon,
          color: iconColor ?? defaultIconColor,
          size: 24,
        ),
      ),
    );
  }
}
