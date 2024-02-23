import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/chat/chat_view_template.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({
    required this.content,
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return ChatViewTemplate(
      content: ChatDetailsPlaceholders(
        content: content,
      ),
      trailing: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.arrowUpFromBracket,
            size: 16,
          ),
        ),
      ],
    );
  }
}

class ChatDetailsPlaceholders extends StatelessWidget {
  const ChatDetailsPlaceholders({
    required this.content,
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 700,
      ),
      child: Column(
        children: [
          Text(content),
          const ChatDetailsPlaceholderItem(),
          const ChatDetailsPlaceholderItem(),
          const ChatDetailsPlaceholderItem(),
          const ChatDetailsPlaceholderItem(),
        ],
      ),
    );
  }
}

class ChatDetailsPlaceholderItem extends StatelessWidget {
  const ChatDetailsPlaceholderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 10,
              width: 80,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
              Container(
                height: 8,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 4),
              Container(
                height: 8,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 4),
              Container(
                height: 8,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 4),
              Container(
                height: 8,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
