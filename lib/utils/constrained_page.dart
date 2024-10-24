import 'package:flutter/material.dart';

class ConstrainedPage extends StatelessWidget {
  const ConstrainedPage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1024,
          ),
          child: child,
        ),
      ),
    );
  }
}
