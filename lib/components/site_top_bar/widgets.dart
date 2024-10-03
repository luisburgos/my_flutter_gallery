import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/utils/is_mobile.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

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
    if (isSmallWidth(context)) {
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

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.iconData,
    this.onPressed,
    this.child,
    this.withBorder = false,
    super.key,
  });

  final IconData iconData;
  final VoidCallback? onPressed;
  final bool withBorder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      decoration: withBorder
          ? null
          : const ShadDecoration(
              border: ShadBorder.none,
            ),
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: 18,
      ),
      child: child,
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

class GithubButton2 extends StatelessWidget {
  const GithubButton2({
    required this.url,
    this.withBorder = false,
    super.key,
  });

  final String url;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return SocialButton(
      iconData: FontAwesomeIcons.github,
      onPressed: _onPressed,
      withBorder: true,
      child: const Text('github.com/luisburgos'),
    );
  }

  Future<void> _onPressed() async {
    await launchUrl(Uri.parse(url));
  }
}

class GithubButton extends StatelessWidget {
  const GithubButton({
    required this.url,
    this.withBorder = false,
    super.key,
  });

  final String url;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return SocialButton(
      iconData: FontAwesomeIcons.github,
      onPressed: _onPressed,
      withBorder: withBorder,
    );
  }

  Future<void> _onPressed() async {
    await launchUrl(Uri.parse(url));
  }
}
