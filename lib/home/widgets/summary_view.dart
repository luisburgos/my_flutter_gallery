import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleColor = ShadTheme.of(context).colorScheme.primary;
    final subtitleColor = ShadTheme.of(context).colorScheme.mutedForeground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hi, I'm Luis 👋",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Software Engineer based in México 🇲🇽',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: titleColor,
          ),
        ),
        Text(
          'Lorem ipsum lorem ipsum lorem Lorem ipsum lorem ipsum lorem 🎯',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }
}
