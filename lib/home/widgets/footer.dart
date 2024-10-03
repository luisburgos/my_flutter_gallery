import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/globals.dart';

class HomePageFooter extends StatelessWidget {
  const HomePageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Made with ❤️ from 🇲🇽',
          style: TextStyle(
            color: secondaryColor,
          ),
        ),
      ],
    );
  }
}
