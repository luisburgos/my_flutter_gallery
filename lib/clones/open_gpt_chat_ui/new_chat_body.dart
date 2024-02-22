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
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 800,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
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
                    onPressed: () {},
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
        ),
      ],
    );
  }
}

class NewChatBody extends StatelessWidget {
  const NewChatBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                      color: Colors.green.shade100,
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