import 'package:flutter/material.dart';

class ChatHistoryView extends StatelessWidget {
  const ChatHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ChatHistorySectionView(
            name: 'Today',
            items: ['A'],
          ),
          ChatHistorySectionView(
            name: 'Yesterday',
            items: ['B', 'C'],
          ),
          ChatHistorySectionView(
            name: 'Previous 7 Days',
            items: ['D', 'E', 'F', 'G'],
          ),
          ChatHistorySectionView(
            name: 'Previous 30 Days',
            items: ['H', 'I', 'J', 'K', 'L', 'M', 'N', 'O'],
          ),
        ],
      ),
    );
  }
}

class ChatHistorySectionView extends StatelessWidget {
  const ChatHistorySectionView({
    required this.name,
    required this.items,
    super.key,
  });

  final String name;
  final List<String> items;

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
          (e) => ChatHistoryItem(
            name: e,
          ),
        ),
      ],
    );
  }
}

class ChatHistoryItem extends StatelessWidget {
  const ChatHistoryItem({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      child: TextButton(
        onPressed: () {
          // TODO(unassigned): handle callback
        },
        child: Text(
          '$name: Lorem ipsum dolor sit amet, consectetur...',
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
