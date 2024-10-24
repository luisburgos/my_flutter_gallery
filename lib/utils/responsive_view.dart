import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/utils/breakpoint_helper.dart';

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
