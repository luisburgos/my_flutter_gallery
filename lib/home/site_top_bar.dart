import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/utils/is_mobile.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SiteTopBarState extends InheritedWidget {
  const SiteTopBarState({
    required this.selectedIndex,
    required this.setIndex,
    required super.child,
    super.key,
  });

  final int selectedIndex;
  final void Function(int, VoidCallback) setIndex;

  static SiteTopBarState of(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<SiteTopBarState>();
    if (state == null) {
      throw Exception('SiteTopBar not found in the widget tree');
    }
    return state;
  }

  @override
  bool updateShouldNotify(SiteTopBarState oldWidget) {
    return oldWidget.selectedIndex != selectedIndex;
  }
}

class SiteTopBar extends StatefulWidget {
  const SiteTopBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<SiteTopBar> createState() => _SiteTopBarState();
}

class _SiteTopBarState extends State<SiteTopBar> {
  int selectedIndex = 0;

  void _setIndex(int index, VoidCallback onChanged) {
    setState(() {
      selectedIndex = index;
      onChanged.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SiteTopBarState(
      selectedIndex: selectedIndex,
      setIndex: _setIndex,
      child: widget.child,
    );
  }
}

class SiteTopBarView extends StatelessWidget {
  const SiteTopBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final siteTopBarState = SiteTopBarState.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      child: Row(
        children: [
          SiteTopBarTabButton(
            onPressed: () => siteTopBarState.setIndex(
              0,
              context.navigateToHome,
            ),
            isSelected: siteTopBarState.selectedIndex == 0,
            iconData: FontAwesomeIcons.house,
            text: 'HOME',
          ),
          const SizedBox(width: 8),
          SiteTopBarTabButton(
            onPressed: () => siteTopBarState.setIndex(
              1,
              context.navigateToGallery,
            ),
            isSelected: siteTopBarState.selectedIndex == 1,
            iconData: FontAwesomeIcons.solidFolderOpen,
            text: 'FLUTTER GALLERY',
          ),
          /*const SizedBox(width: 8),
          SiteTopBarTabButton(
            onPressed: () => siteTopBarState.setIndex(
              2,
              context.navigateToAbout,
            ),
            isSelected: siteTopBarState.selectedIndex == 2,
            iconData: FontAwesomeIcons.user,
            text: 'ABOUT',
          ),*/
          const Spacer(),
          //const XTwitterButton(),
          const GithubButton(
            url: 'https://github.com/luisburgos',
          ),
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
  const GithubButton({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return SocialButton(
      iconData: FontAwesomeIcons.github,
      onPressed: _onPressed,
    );
  }

  Future<void> _onPressed() async {
    await launchUrl(Uri.parse(url));
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
