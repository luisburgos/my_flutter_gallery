import 'package:flutter/material.dart';

class HoverAware extends StatefulWidget {
  const HoverAware({
    required this.builder,
    super.key,
  });

  // ignore: avoid_positional_boolean_parameters
  final Widget Function(bool isHovered) builder;

  @override
  State<HoverAware> createState() => _HoverAwareState();
}

class _HoverAwareState extends State<HoverAware> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: widget.builder(_isHovered),
    );
  }
}
