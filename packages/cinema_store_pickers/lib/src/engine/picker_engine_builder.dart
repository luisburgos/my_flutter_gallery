import 'package:cinema_store_pickers/src/engine/sections/picker_engine_sections_view.dart';
import 'package:cinema_store_pickers/src/engine/sections/picker_engine_selection_summary.dart';
import 'package:cinema_store_pickers/src/engine/sections/section/models/models.dart';
import 'package:flutter/material.dart';

import 'sections/section/models/picker_engine_icon_data_locator.dart';

/// @no-doc
class PickerEngineWidget extends StatelessWidget {
  /// @no-doc
  const PickerEngineWidget({
    required this.sections,
    required this.color,
    required this.iconDataLocator,
    this.selections,
    super.key,
  });

  /// @no-doc
  final List<PickerEngineSection<dynamic>> sections;

  /// @no-doc
  final List<PickerEngineItem>? selections;

  /// @no-doc
  final Color color;

  /// @no-doc
  final IconDataLocator iconDataLocator;

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
              iconDataLocator: iconDataLocator,
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
