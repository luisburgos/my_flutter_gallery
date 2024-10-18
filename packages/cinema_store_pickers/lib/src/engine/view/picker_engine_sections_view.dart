import 'package:cinema_store_pickers/src/engine/models/models.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_section_items.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_section_preview.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_section_title.dart';
import 'package:flutter/material.dart';

/// @no-doc
class DefaultPickerEngineSectionView extends StatelessWidget {
  /// @no-doc
  const DefaultPickerEngineSectionView({
    required this.title,
    required this.options,
    required this.withPreview,
    required this.color,
    required this.iconDataLocator,
    required this.onRemove,
    required this.onToggleSelection,
    required this.selected,
    super.key,
  });

  /// @no-doc
  final String title;

  /// @no-doc
  final bool withPreview;

  /// @no-doc
  final Color color;

  /// @no-doc
  final List<PickerEngineItem> options;

  /// @no-doc
  final List<PickerEngineItem> selected;

  /// @no-doc
  final void Function(PickerEngineItem option) onRemove;

  /// @no-doc
  final void Function(PickerEngineItem option) onToggleSelection;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PickerEngineSectionTitle(
          title,
          color: color,
        ),
        const SizedBox(height: 12),
        if (withPreview) ...[
          PickerEngineSectionPreview(
            items: selected,
            onRemoveTap: onRemove,
            iconDataLocator: iconDataLocator,
          ),
          const SizedBox(height: 12),
        ],
        PickerEngineSectionItems(
          items: options,
          selectedItems: selected,
          onOptionTap: onToggleSelection,
          selectedColor: color,
          iconDataLocator: iconDataLocator,
        ),
      ],
    );
  }
}
