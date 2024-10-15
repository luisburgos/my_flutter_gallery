import 'package:cinema_store_pickers/src/pickomatic/sections/section/models/section_option.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/section/view/pickomatic_section_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:shared_utils/shared_utils.dart';

/// @no-doc
class PickOMaticSectionOptions extends StatelessWidget {
  /// @no-doc
  const PickOMaticSectionOptions({
    required this.items,
    required this.selectedItems,
    required this.onOptionTap,
    required this.selectedColor,
    super.key,
  });

  /// @no-doc
  final List<PickOMaticSectionOption> items;

  /// @no-doc
  final List<PickOMaticSectionOption> selectedItems;

  /// @no-doc
  final void Function(PickOMaticSectionOption) onOptionTap;

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
            item: items[i],
            onOptionTap: onOptionTap,
            isSelected: selectedItems.contains(items[i]),
            selectedColor: selectedColor,
          ),
      ],
    );
  }
}
