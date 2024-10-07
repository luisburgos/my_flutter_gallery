import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/experimental_item_cover.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const galleryItemCoverHeight = 178.0;
const experimental = true;

class GalleryItemCover extends StatelessWidget {
  const GalleryItemCover({
    required this.icon,
    required this.height,
    required this.width,
    required this.coverBuilder,
    this.iconColor,
    this.margin,
    super.key,
  });

  final Icon icon;
  final double height;
  final double width;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;
  final CoverBuilder? coverBuilder;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = ShadTheme.of(context).colorScheme.secondary;
    final defaultIconColor =
        iconColor ?? ShadTheme.of(context).colorScheme.primary;

    return GalleryItemCoverContainer(
      margin: margin ?? const EdgeInsets.all(24),
      height: height,
      width: width,
      backgroundColor: experimental ? null : secondaryColor.withOpacity(0.8),
      child: Center(
        child: experimental
            ? coverBuilder!(
                defaultArtColors.copyWith(
                  accentColor: defaultIconColor,
                ),
              )
            : Icon(
                icon.icon,
                color: defaultIconColor,
                size: 24,
              ),
      ),
    );
  }
}

class GalleryItemCoverContainer extends StatelessWidget {
  const GalleryItemCoverContainer({
    required this.child,
    required this.height,
    required this.width,
    this.margin,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final double height;
  final double width;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: margin ?? const EdgeInsets.all(24),
      height: height,
      width: width,
      child: child,
    );
  }
}
