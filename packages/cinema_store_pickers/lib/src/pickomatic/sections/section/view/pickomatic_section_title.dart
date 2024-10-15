import 'package:flutter/material.dart';

/// @no-doc
class PickOMaticSectionTitle extends StatelessWidget {
  /// @no-doc
  const PickOMaticSectionTitle(
    this.text, {
    required this.color,
    super.key,
  });

  /// @no-doc
  final String text;

  /// @no-doc
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
