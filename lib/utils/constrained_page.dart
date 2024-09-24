import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadResponsivePage extends StatelessWidget {
  const ShadResponsivePage({
    required this.child,
    required this.smChild,
    super.key,
  });

  final Widget child;
  final Widget smChild;

  @override
  Widget build(BuildContext context) {
    final sm = context.breakpoint >= ShadTheme.of(context).breakpoints.sm;
    if (sm) return smChild;
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
            maxWidth: 800,
          ),
          child: child,
        ),
      ),
    );
  }
}
