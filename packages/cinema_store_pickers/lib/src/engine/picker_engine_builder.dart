import 'package:cinema_store_pickers/src/engine/sections/picker_engine_sections_view.dart';
import 'package:cinema_store_pickers/src/engine/sections/picker_engine_selection_summary.dart';
import 'package:cinema_store_pickers/src/engine/sections/section/models/models.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickerEngineWidget extends StatelessWidget {
  /// @no-doc
  const PickerEngineWidget({
    required this.sections,
    required this.color,
    this.selections,
    super.key,
  });

  /// @no-doc
  final List<PickerEngineSection<dynamic>> sections;

  /// @no-doc
  final List<PickerEngineItem>? selections;

  /// @no-doc
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: PickerEngineSectionsViews(
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
          child: PickerEngineSelectionSummary(
            brandColor: color,
            selections: selections ?? [],
          ),
        ),
      ],
    );
  }
}
