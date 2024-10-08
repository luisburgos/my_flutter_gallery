import 'package:flutter/material.dart';
import 'package:lowframer/lowframer.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const galleryItemCoverHeight = 178.0;
const experimental = true;

class GalleryItemCover extends StatelessWidget {
  const GalleryItemCover({
    required this.icon,
    required this.height,
    required this.width,
    required this.coverBuilder,
    required this.iconColor,
    this.margin,
    this.displayDecoration = false,
    super.key,
  });

  final Icon icon;
  final double height;
  final double width;
  final Color iconColor;
  final EdgeInsetsGeometry? margin;
  final CoverBuilder? coverBuilder;
  final bool displayDecoration;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = ShadTheme.of(context).colorScheme.secondary;
    final defaultIconColor =
        ShadTheme.of(context).colorScheme.primary.withOpacity(
              0.3,
            );

    final experimentalColor =
        displayDecoration ? iconColor : Colors.grey.shade200;

    return GalleryItemCoverContainer(
      margin: margin ?? const EdgeInsets.all(24),
      height: height,
      width: width,
      backgroundColor: experimental
          ? experimentalColor.withOpacity(0.25)
          : secondaryColor.withOpacity(0.8),
      child: Center(
        child: experimental
            ? Card(
                elevation: displayDecoration ? 12 : 0,
                child: coverBuilder!(
                  defaultArtColors.copyWith(
                    accentColor:
                        displayDecoration ? iconColor : defaultIconColor,
                    //borderColor:
                    //displayDecoration ? iconColor : defaultIconColor,
                  ),
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
