import 'package:cinema_store_pickers/src/engine/models/models.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_sections_summary.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_sections_view.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickerEngineWidget extends StatefulWidget {
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
  State<PickerEngineWidget> createState() => _PickerEngineWidgetState();
}

class _PickerEngineWidgetState extends State<PickerEngineWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: PickerEngineSectionsBuilder(
              color: widget.color,
              sections: widget.sections,
              iconDataLocator: widget.iconDataLocator,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: PickerEngineSectionsSummary(
            brandColor: widget.color,
            selections: widget.selections ?? [],
          ),
        ),
      ],
    );
  }
}
