import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    this.withPersonalGithub = true,
  });

  final bool withPersonalGithub;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //const XTwitterButton(),
        if (withPersonalGithub)
          const GithubButton(
            url: 'https://github.com/luisburgos',
          ),
      ],
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
