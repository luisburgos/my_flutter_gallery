import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/utils/is_mobile.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({
    required this.child,
    this.smChild,
    super.key,
  });

  final Widget child;
  final Widget? smChild;

  @override
  Widget build(BuildContext context) {
    if (isSmallWidth(context) && smChild != null) return smChild!;
    return child;
  }
}

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
