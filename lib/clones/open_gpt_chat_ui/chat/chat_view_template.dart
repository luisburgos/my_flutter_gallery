import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/dialogs/dialogs.dart';
import 'package:my_flutter_gallery/shared/trailing_icon_text_button.dart';

class ChatViewTemplate extends StatelessWidget {
  const ChatViewTemplate({
    required this.content,
    this.selectedModelName = 'GPT 3.5',
    this.trailing = const [],
    super.key,
  });

  final String selectedModelName;
  final List<Widget> trailing;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatViewTemplateHeader(
          selectedModelName: selectedModelName,
          trailing: trailing,
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: SizedBox.expand(
              child: Center(
                child: content,
              ),
            ),
          ),
        ),
        ChatViewTemplateFooter(
          onHelpTap: () => _onHelpTap(context),
          onSendTap: () {
            // TODO(unassigned): implement send message
          },
        ),
      ],
    );
  }

  void _onHelpTap(BuildContext context) {
    openDialog(
      context,
      child: const KeyboardShortcutsDialog(),
    );
  }
}

class ChatViewTemplateHeader extends StatelessWidget {
  const ChatViewTemplateHeader({
    required this.selectedModelName,
    required this.trailing,
    super.key,
  });

  final String selectedModelName;
  final List<Widget> trailing;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      height: 64,
      width: double.infinity,
      child: Row(
        children: [
          TrailingIconTextButton(
            label: selectedModelName,
            icon: const Icon(
              FontAwesomeIcons.chevronDown,
              size: 12,
            ),
            color: primary,
            onPressed: () {},
          ),
          const Spacer(),
          ...trailing,
        ],
      ),
    );
  }
}

class ChatViewTemplateFooter extends StatelessWidget {
  const ChatViewTemplateFooter({
    required this.onSendTap,
    required this.onHelpTap,
    super.key,
  });

  final VoidCallback onHelpTap;
  final VoidCallback onSendTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 80,
          ),
          constraints: const BoxConstraints(
            maxWidth: 800,
          ),
          child: TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hintStyle: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              hintText: 'Message GPT...',
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onSendTap,
                  icon: const Icon(
                    FontAwesomeIcons.arrowUp,
                    size: 18,
                  ),
                ), // this is right side.
              ),
            ),
            style: const TextStyle(
              color: Color.fromRGBO(25, 25, 35, 1),
              fontSize: 18,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 16,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton.outlined(
              onPressed: onHelpTap,
              icon: const Icon(
                FontAwesomeIcons.question,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
