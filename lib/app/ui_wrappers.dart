import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum BetaGalleryItemMode {
  preview,
  full;
}

const itemCardWidth = 350.0;

class BetaGalleryItem extends StatelessWidget {
  const BetaGalleryItem({
    required this.item,
    required this.onItemTap,
    this.displayCover = true,
    this.scheme = defaultScheme,
    this.margin = const EdgeInsets.all(8),
    this.mode = BetaGalleryItemMode.full,
    super.key,
  });

  final EdgeInsetsGeometry margin;
  final bool displayCover;
  final AppUiScheme scheme;
  final GalleryItemData item;
  final void Function(GalleryItemData) onItemTap;
  final BetaGalleryItemMode mode;

  @override
  Widget build(BuildContext context) {
    final subtitleColor = ShadTheme.of(context).colorScheme.mutedForeground;

    if (scheme == AppUiScheme.shadcn) {
      if (mode == BetaGalleryItemMode.preview) {
        return Container(
          margin: margin,
          child: ShadCard(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (displayCover)
                  ItemCover(
                    icon: item.iconData,
                    mode: ItemCoverMode.square,
                  )
                else
                  const SizedBox.shrink(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WrapperText(
                          item.name,
                          fontSize: 16,
                        ),
                        WrapperText(
                          'Lorem description this is a lorem description '
                          'with truncate enabled for longer descriptions as '
                          'this one in the example',
                          fontSize: 12,
                          maxLines: 2,
                          color: subtitleColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }

      return Container(
        margin: margin,
        child: ShadCard(
          padding: EdgeInsets.zero,
          width: itemCardWidth,
          /*footer: WrapperPlayIconButton(
            onPressed: () => onItemTap(item),
          ),*/
          title: displayCover
              ? ItemCover(
                  icon: item.iconData,
                )
              : const SizedBox.shrink(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WrapperText(
                  item.name,
                  fontSize: 16,
                ),
                WrapperText(
                  item.description,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: subtitleColor,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(8),
      child: NeuContainer(
        borderWidth: 2,
        color: Colors.white,
        offset: const Offset(3, 3),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (displayCover)
                  ItemCover(
                    icon: item.iconData,
                  ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: WrapperText(
                    item.name,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Positioned(
              right: -2,
              bottom: 0,
              //top: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: WrapperPlayIconButton(
                    onPressed: () => onItemTap(item),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ItemCoverMode {
  square,
  rectangle;
}

class ItemCover extends StatelessWidget {
  const ItemCover({
    required this.icon,
    this.mode = ItemCoverMode.rectangle,
    super.key,
  });

  final ItemCoverMode mode;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final color = ShadTheme.of(context).colorScheme.secondary;
    final iconColor = ShadTheme.of(context).colorScheme.primary;

    final isSquareMode = mode == ItemCoverMode.square;
    final height = isSquareMode ? 100.0 : 120.0;
    final width = isSquareMode ? 100.0 : itemCardWidth;

    final borderRadius = isSquareMode
        ? BorderRadius.circular(8)
        : const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          );

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icon.icon,
          color: iconColor,
          size: 24,
        ),
      ),
    );
  }
}

class WrapperPlayIconButton extends StatelessWidget {
  const WrapperPlayIconButton({
    required this.onPressed,
    this.scheme = defaultScheme,
    super.key,
  });

  final AppUiScheme scheme;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const icon = Icon(
      Icons.play_arrow_sharp,
      color: Colors.white,
      size: 18,
    );

    if (scheme == AppUiScheme.shadcn) {
      return ShadButton.outline(
        icon: icon,
        onPressed: onPressed,
      );
    }

    return NeuIconButton(
      borderRadius: BorderRadius.circular(20),
      buttonColor: ColorsExtended.neoPrimary,
      buttonHeight: 40,
      buttonWidth: 40,
      borderWidth: 2,
      shadowColor: Colors.transparent,
      enableAnimation: true,
      icon: icon,
      onPressed: onPressed,
    );
  }
}

enum AppUiScheme {
  neobrutalism,
  shadcn,
}

const defaultScheme = AppUiScheme.shadcn;

class WrapperText extends Text {
  const WrapperText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.scheme = defaultScheme,
    this.maxLines,
  }) : super('');

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final AppUiScheme scheme;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    if (scheme == AppUiScheme.shadcn) {
      return Text(
        text,
        maxLines: maxLines,
        softWrap: false,
        style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return Text(
      text,
      style: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class WrapperDivider extends StatelessWidget {
  const WrapperDivider({
    this.scheme = defaultScheme,
    super.key,
  });

  final AppUiScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: scheme == AppUiScheme.shadcn ? 1 : 2,
      color: Colors.black,
    );
  }
}
