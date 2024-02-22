import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> openDialog(
  BuildContext context, {
  required Widget child,
  double width = 800,
  double height = 600,
}) {
  return showAdaptiveDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 10),
        content: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      );
    },
  );
}

class KeyboardShortcutsDialog extends StatelessWidget {
  const KeyboardShortcutsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const DialogBase(
      title: 'Keyboard Shortcuts',
      body: Placeholder(),
    );
  }
}

class ShareLinkToChatDialog extends StatelessWidget {
  const ShareLinkToChatDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const DialogBase(
      title: 'Share link to Chat',
      body: Placeholder(),
    );
  }
}

class UpgradeYourPlanDialog extends StatelessWidget {
  const UpgradeYourPlanDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const DialogBase(
      title: 'Upgrade your plan',
      body: Placeholder(),
    );
  }
}

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const DialogBase(
      title: 'Settings',
      body: Placeholder(),
    );
  }
}

class DialogBase extends StatelessWidget {
  const DialogBase({
    required this.title,
    required this.body,
    super.key,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            const Spacer(),
            IconButton(
              onPressed: () {
                final navigator = Navigator.of(context);
                if (navigator.canPop()) {
                  navigator.pop();
                }
              },
              icon: const Icon(
                FontAwesomeIcons.xmark,
                size: 16,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.2,
          height: 1,
        ),
        body,
      ],
    );
  }
}
