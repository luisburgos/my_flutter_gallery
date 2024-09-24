import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/utils/constrained_page.dart';

class HomePageTemplate extends StatelessWidget {
  const HomePageTemplate({
    required this.summary,
    required this.latestItems,
    super.key,
  });

  final Widget summary;
  final Widget latestItems;

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      smChild: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: summary,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: latestItems,
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(minWidth: 380),
                  child: summary,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(minWidth: 380),
                  child: latestItems,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
