import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:shared_utils/shared_utils.dart';

/// @no-doc
class PickOMaticItems extends StatelessWidget {
  /// @no-doc
  const PickOMaticItems({
    required this.items,
    required this.selectedItems,
    required this.onOptionTap,
    required this.selectedColor,
    super.key,
  });

  /// @no-doc
  final List<PickOMaticItem> items;

  /// @no-doc
  final List<PickOMaticItem> selectedItems;

  /// @no-doc
  final void Function(PickOMaticItem) onOptionTap;

  /// @no-doc
  final Color selectedColor;

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
          ),
      ],
    );
  }
}
