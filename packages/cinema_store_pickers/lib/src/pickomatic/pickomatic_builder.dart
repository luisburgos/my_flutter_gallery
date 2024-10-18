import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/pickomatic_selection_summary.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickOMaticWidget extends StatelessWidget {
  /// @no-doc
  const PickOMaticWidget({
    required this.sections,
    required this.color,
    this.selections,
    super.key,
  });

  /// @no-doc
  final List<PickOMaticSection<dynamic>> sections;

  /// @no-doc
  final List<PickOMaticItem>? selections;

  /// @no-doc
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: PickOMaticSectionsViews(
              color: color,
              sections: sections,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: PickOMaticSelectionSummary(
            brandColor: color,
            selections: selections ?? [],
          ),
        ),
      ],
    );
  }
}
