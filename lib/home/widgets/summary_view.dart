import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/globals.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableText.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.normal,
              height: 1.21,
              color: primaryColor,
            ),
            children: [
              TextSpan(
                text: "Hi, I'm",
              ),
              TextSpan(
                text: ' Luis ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '👋',
              ),
            ],
          ),
        ),
        SelectableText.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.normal,
              height: 1.21,
              color: primaryColor,
            ),
            children: [
              TextSpan(
                text: 'Welcome to my',
              ),
              TextSpan(
                text: ' flutter ',
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'gallery',
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        SelectableText.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              height: 1.34,
              color: secondaryColor,
            ),
            children: [
              TextSpan(
                text: 'A playground where I dive into the design and '
                    'implementation heuristics of',
              ),
              TextSpan(
                text: ' features and components ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '(bits) drawn from apps that inspire me.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
