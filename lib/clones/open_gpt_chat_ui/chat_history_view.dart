import 'package:flutter/material.dart';

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
              items: ['A'],
              onItemTap: onItemTap,
            ),
            ChatHistorySectionView(
              name: 'Yesterday',
              items: ['B', 'C'],
              onItemTap: onItemTap,
            ),
            ChatHistorySectionView(
              name: 'Previous 7 Days',
              items: ['D', 'E', 'F', 'G'],
              onItemTap: onItemTap,
            ),
            ChatHistorySectionView(
              name: 'Previous 30 Days',
              items: ['H', 'I', 'J', 'K', 'L', 'M', 'N', 'O'],
              onItemTap: onItemTap,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatHistorySectionView extends StatelessWidget {
  const ChatHistorySectionView({
    required this.name,
    required this.items,
    required this.onItemTap,
    super.key,
  });

  final String name;
  final List<String> items;
  final OnChatHistoryItemTap onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        ...items.map(
          (e) => ChatHistoryItem(name: e, onItemTap: onItemTap),
        ),
      ],
    );
  }
}

class ChatHistoryItem extends StatelessWidget {
  const ChatHistoryItem({
    required this.name,
    required this.onItemTap,
    super.key,
  });

  final String name;
  final OnChatHistoryItemTap onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      child: TextButton(
        onPressed: () => onItemTap(name),
        child: Text(
          '$name: Lorem ipsum dolor sit amet, consectetur...',
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
