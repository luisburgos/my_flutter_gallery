import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/utils/is_mobile.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SiteTopBar extends StatelessWidget {
  const SiteTopBar({
    required this.onHomeTap,
    required this.onGalleryTap,
    this.selectedIndex = 0,
    super.key,
  });

  final int selectedIndex;
  final VoidCallback? onHomeTap;
  final VoidCallback? onGalleryTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      child: Row(
        children: [
          SiteTopBarTabButton(
            onPressed: onHomeTap,
            isSelected: selectedIndex == 0,
            iconData: FontAwesomeIcons.house,
            text: 'HOME',
          ),
          const SizedBox(width: 8),
          SiteTopBarTabButton(
            onPressed: onGalleryTap,
            isSelected: selectedIndex == 1,
            iconData: FontAwesomeIcons.solidFolderOpen,
            text: 'FLUTTER GALLERY',
          ),
          const Spacer(),
          const XTwitterButton(),
          const GithubButton(),
        ],
      ),
    );
  }
}

class SiteTopBarTabButton extends StatelessWidget {
  const SiteTopBarTabButton({
    required this.isSelected,
    required this.iconData,
    required this.text,
    this.onPressed,
    super.key,
  });

  final String text;
  final bool isSelected;
  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      final selectedColor = ShadTheme.of(context).colorScheme.primary;
      final baseColor = ShadTheme.of(context).colorScheme.mutedForeground;

      return ShadButton.outline(
        decoration: const ShadDecoration(
          border: ShadBorder.none,
        ),
        foregroundColor: isSelected ? selectedColor : baseColor,
        onPressed: onPressed,
        icon: Icon(
          iconData,
          size: 18,
        ),
      );
    }

    final textView = Text(text);
    if (isSelected) {
      return ShadButton(
        size: ShadButtonSize.sm,
        onPressed: onPressed,
        child: textView,
      );
    }

    return ShadButton.ghost(
      size: ShadButtonSize.sm,
      onPressed: onPressed,
      child: textView,
    );
  }
}

class XTwitterButton extends StatelessWidget {
  const XTwitterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialButton(
      iconData: FontAwesomeIcons.xTwitter,
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    // TODO(luisburgos): open github profile.
  }
}

class GithubButton extends StatelessWidget {
  const GithubButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialButton(
      iconData: FontAwesomeIcons.github,
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    // TODO(luisburgos): open github profile.
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.iconData,
    this.onPressed,
    super.key,
  });

  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      decoration: const ShadDecoration(
        border: ShadBorder.none,
      ),
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: 18,
      ),
    );
  }
}
