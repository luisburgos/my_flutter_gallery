import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/legacy/clones/open_gpt_chat_ui/chat/chat_view_template.dart';

class NewChatView extends StatelessWidget {
  const NewChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatViewTemplate(
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 700,
        ),
        child: const Column(
          children: [
            Spacer(),
            Center(
              child: Text(
                'How can I help you today?',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Spacer(),
            SuggestionsBox(),
          ],
        ),
      ),
    );
  }
}

class SuggestionsBox extends StatelessWidget {
  const SuggestionsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SuggestedStarterMessageItem(
                  title: 'Suggestion A',
                  description: 'Description A',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SuggestedStarterMessageItem(
                  title: 'Suggestion B',
                  description: 'Description B',
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: SuggestedStarterMessageItem(
                  title: 'Suggestion C',
                  description: 'Description C',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: SuggestedStarterMessageItem(
                  title: 'Suggestion D',
                  description: 'Description D',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SuggestedStarterMessageItem extends StatelessWidget {
  const SuggestedStarterMessageItem({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: primaryColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
