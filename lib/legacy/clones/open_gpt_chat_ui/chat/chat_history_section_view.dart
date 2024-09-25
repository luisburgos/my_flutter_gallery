import 'package:flutter/material.dart';

typedef OnChatHistoryItemTap = void Function(String);

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
