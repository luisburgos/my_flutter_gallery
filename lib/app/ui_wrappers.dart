import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const WrapperText(
          'My ',
          fontSize: 22,
        ),
        WrapperText(
          'Flutter',
          color: ColorsExtended.neoTertiary,
          fontSize: 22,
        ),
        const WrapperText(
          ' Gallery',
          fontSize: 22,
        ),
      ],
    );
  }
}

class BetaGalleryItem extends StatelessWidget {
  const BetaGalleryItem({
    required this.item,
    required this.onItemTap,
    this.displayCover = false,
    this.scheme = defaultScheme,
    this.margin = const EdgeInsets.all(8),
    super.key,
  });

  final EdgeInsetsGeometry margin;
  final bool displayCover;
  final AppUiScheme scheme;
  final GalleryItemData item;
  final void Function(GalleryItemData) onItemTap;

  @override
  Widget build(BuildContext context) {
    if (scheme == AppUiScheme.shadcn) {
      return Container(
        margin: margin,
        child: ShadCard(
          width: 350,
          title: WrapperText(
            item.name,
            fontSize: 16,
          ),
          footer: WrapperPlayIconButton(
            onPressed: () => onItemTap(item),
          ),
          child: displayCover ? const ItemCover() : const SizedBox.shrink(),
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
                if (displayCover) const ItemCover(),
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

class ItemCover extends StatelessWidget {
  const ItemCover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsExtended.neoPrimary,
      height: 128,
      width: 270,
      child: const Center(
        child: Icon(
          Icons.terminal,
          color: Colors.white,
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

class WrapperSupportButton extends StatelessWidget {
  const WrapperSupportButton({
    this.scheme = defaultScheme,
    super.key,
  });

  final AppUiScheme scheme;

  @override
  Widget build(BuildContext context) {
    if (scheme == AppUiScheme.shadcn) {
      return ShadButton(
        child: const WrapperText(
          'Support me',
          color: Colors.white,
          fontSize: 16,
        ),
        onPressed: () {},
      );
    }

    return NeuTextButton(
      buttonColor: ColorsExtended.neoPrimary,
      buttonHeight: 40,
      buttonWidth: 200,
      borderWidth: 2,
      //shadowColor: Colors.transparent,
      //offset: Offset(1, 1),
      enableAnimation: true,
      text: const WrapperText(
        'Support me',
        color: Colors.white,
        fontSize: 16,
      ),
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
  }) : super('');

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final AppUiScheme scheme;

  @override
  Widget build(BuildContext context) {
    if (scheme == AppUiScheme.shadcn) {
      return Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color,
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
