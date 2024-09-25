import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/legacy/clones/open_gpt_chat_ui/chat/chat_history_section_view.dart';

typedef OnChatHistoryItemTap = void Function(String);

class ChatHistoryView extends StatelessWidget {
  const ChatHistoryView({
    required this.onItemTap,
    super.key,
  });

  final OnChatHistoryItemTap onItemTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ChatHistorySectionView(
              name: 'Today',
              items: const ['A'],
              onItemTap: onItemTap,
            ),
            ChatHistorySectionView(
              name: 'Yesterday',
              items: const ['B', 'C'],
              onItemTap: onItemTap,
            ),
            ChatHistorySectionView(
              name: 'Previous 7 Days',
              items: const ['D', 'E', 'F', 'G'],
              onItemTap: onItemTap,
            ),
            ChatHistorySectionView(
              name: 'Previous 30 Days',
              items: const ['H', 'I', 'J', 'K', 'L', 'M', 'N', 'O'],
              onItemTap: onItemTap,
            ),
          ],
        ),
      ),
    );
  }
}
