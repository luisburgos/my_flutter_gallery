import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/globals.dart';

class HomePageTemplate extends StatelessWidget {
  const HomePageTemplate({
    required this.header,
    required this.body,
    required this.footer,
    super.key,
  });

  final Widget header;
  final Widget body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1024,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: maxWidthConstraint,
                          ),
                          padding: const EdgeInsets.only(
                            top: 100,
                          ),
                          child: header,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 32,
                          ),
                          child: body,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 64,
                            bottom: 18,
                          ),
                          child: footer,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
