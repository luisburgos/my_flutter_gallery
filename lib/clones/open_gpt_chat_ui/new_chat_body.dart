import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatViewTemplate extends StatelessWidget {
  const ChatViewTemplate({
    required this.content,
    this.trailing = const [],
    super.key,
  });

  final List<Widget> trailing;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        SizedBox(
          height: 64,
          width: double.infinity,
          child: Row(
            children: [
              const Text('TODO: ModelSelector'),
              const Spacer(),
              ...trailing,
            ],
          ),
        ),
        Expanded(
          child: SizedBox.expand(
            child: ColoredBox(
              color: primary.withOpacity(0.05),
              child: Center(
                child: content,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ColoredBox(
            color: primary.withOpacity(0.1),
            child: const Center(
              child: Text(
                'Input',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NewChatBody extends StatelessWidget {
  const NewChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatViewTemplate(
      content: Text(
        'New Chat Content',
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatViewTemplate(
      trailing: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.arrowUpFromBracket,
            size: 16,
          ),
        ),
      ],
      content: const Text(
        'Existing Chat Content',
      ),
    );
  }
}
