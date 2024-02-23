import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/chat/chat_view_template.dart';

class NewChatView extends StatelessWidget {
  const NewChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ChatViewTemplate(
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        child: Column(
          children: [
            const Spacer(),
            const Center(
              child: Text(
                'How can I help you today?',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 4.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(4, (index) {
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
                          'Name $index',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Description $index',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
