import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:shared_utils/shared_utils.dart';
import 'package:store_picker/src/engine/models/models.dart';
import 'package:store_picker/src/engine/view/picker_engine_section_preview_item.dart';

const _minHeight = 40.0;

/// @no-doc
class PickerEngineSectionPreview extends StatelessWidget {
  /// @no-doc
  const PickerEngineSectionPreview({
    required this.items,
    required this.onRemoveTap,
    required this.iconDataLocator,
    super.key,
  });

  /// @no-doc
  final List<PickerEngineItem> items;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  /// @no-doc
  final void Function(PickerEngineItem) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: Colors.grey.shade200,
        width: double.infinity,
        height: _minHeight,
      );
    }

    final calculations = SimpleLayoutGridCalculations(
      crossAxisCount: items.length,
      itemCount: items.length,
    );
    final (columnSizes, rowSizes) = calculations.sizes;
    final (rowGap, columGap) = calculations.gaps;

    return LayoutGrid(
      columnSizes: columnSizes,
      rowSizes: rowSizes,
      columnGap: columGap,
      rowGap: rowGap,
      children: [
        for (var i = 0; i < items.length; i++)
          PickerSelectionPreviewItem(
            key: Key('preview-item-${items[i]}'),
            item: items[i],
            onRemoveTap: onRemoveTap,
            displayRemoveButton: items.length > 1,
            iconDataLocator: iconDataLocator,
          ),
      ],
    );
  }
}
