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
            Radius.circular(12),
          ),
        ),
        contentPadding: EdgeInsets.zero,
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  KeyboardShortcutListTile(
                    name: 'Open new chat',
                    keys: ['CMD', 'Shift', 'O'],
                  ),
                  KeyboardShortcutListTile(
                    name: 'Focus chat input',
                    keys: ['CMD', 'Shift', 'O'],
                  ),
                  KeyboardShortcutListTile(
                    name: 'Copy last code block',
                    keys: ['CMD', 'Shift', 'O'],
                  ),
                  KeyboardShortcutListTile(
                    name: 'Copy last code response',
                    keys: ['CMD', 'Shift', 'O'],
                  ),
                ],
              ),
            ),
            SizedBox(width: 22),
            Expanded(
              child: Column(
                children: [
                  KeyboardShortcutListTile(
                    name: 'Open new chat',
                    keys: ['CMD', 'Shift', 'O'],
                  ),
                  KeyboardShortcutListTile(
                    name: 'Focus chat input',
                    keys: ['CMD', 'Shift', 'O'],
                  ),
                  KeyboardShortcutListTile(
                    name: 'Copy last code block',
                    keys: ['CMD', 'Shift', 'O'],
                  ),
                  KeyboardShortcutListTile(
                    name: 'Copy last code response',
                    keys: ['CMD', 'Shift', 'O'],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class KeyboardShortcutListTile extends StatelessWidget {
  const KeyboardShortcutListTile({
    required this.name,
    required this.keys,
    super.key,
  });

  final String name;
  final List<String> keys;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText(name),
          KeysCombinationText(keys: keys),
        ],
      ),
    );
  }
}

class KeysCombinationText extends StatelessWidget {
  const KeysCombinationText({
    required this.keys,
    super.key,
  });

  final List<String> keys;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (final key in keys) {
      print(key);
      final itemWidget = _buildItem(key);
      children.add(itemWidget);
      print(children);

      final keyIndex = keys.indexOf(key);
      if (keyIndex != keys.length - 1) {
        children.add(const SelectableText('+'));
      }
    }
    return Row(children: children);
  }

  Widget _buildItem(String key) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
      ),
      child: SelectableText(
        key,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
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
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  final navigator = Navigator.of(context);
                  if (navigator.canPop()) {
                    navigator.pop();
                  }
                },
                icon: const Icon(
                  FontAwesomeIcons.xmark,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.2,
          height: 1,
        ),
        Expanded(child: body),
      ],
    );
  }
}
