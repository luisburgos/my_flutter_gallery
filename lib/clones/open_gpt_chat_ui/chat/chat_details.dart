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
      content: Text(content),
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
