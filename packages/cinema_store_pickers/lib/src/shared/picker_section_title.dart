import 'package:flutter/material.dart';

/// @no-doc
class PickerSectionTitle extends StatelessWidget {
  /// @no-doc
  const PickerSectionTitle(
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
