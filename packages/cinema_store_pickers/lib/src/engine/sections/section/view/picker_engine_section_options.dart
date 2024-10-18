import 'package:cinema_store_pickers/src/engine/sections/section/models/picker_engine_icon_data_locator.dart';
import 'package:cinema_store_pickers/src/engine/sections/section/models/picker_engine_item.dart';
import 'package:cinema_store_pickers/src/engine/sections/section/view/picker_engine_section_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:shared_utils/shared_utils.dart';

/// @no-doc
class PickerEngineItems extends StatelessWidget {
  /// @no-doc
  const PickerEngineItems({
    required this.items,
    required this.selectedItems,
    required this.onOptionTap,
    required this.selectedColor,
    required this.iconDataLocator,
    super.key,
  });

  /// @no-doc
  final List<PickerEngineItem> items;

  /// @no-doc
  final List<PickerEngineItem> selectedItems;

  /// @no-doc
  final void Function(PickerEngineItem) onOptionTap;

  /// @no-doc
  final Color selectedColor;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  @override
  Widget build(BuildContext context) {
    final calculations = SimpleLayoutGridCalculations(
      crossAxisCount: 2,
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
          PickerSectionOptionView(
            key: Key('option-view-${items[i].name}'),
            item: items[i],
            onOptionTap: onOptionTap,
            isSelected: selectedItems.contains(items[i]),
            selectedColor: selectedColor,
            iconDataLocator: iconDataLocator,
          ),
      ],
    );
  }
}
