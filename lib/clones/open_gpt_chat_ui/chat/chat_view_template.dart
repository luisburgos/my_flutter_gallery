import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/shared/trailing_icon_text_button.dart';

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
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          height: 64,
          width: double.infinity,
          child: Row(
            children: [
              TrailingIconTextButton(
                label: 'GPT 3.5',
                icon: const Icon(
                  FontAwesomeIcons.chevronDown,
                  size: 12,
                ),
                color: primary,
                onPressed: () {},
              ),
              const Spacer(),
              ...trailing,
            ],
          ),
        ),
        Expanded(
          child: SizedBox.expand(
            child: Center(
              child: content,
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
