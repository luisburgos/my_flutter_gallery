import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:shared_utils/shared_utils.dart';

/// @no-doc
class PickerSectionOptions extends StatelessWidget {
  /// @no-doc
  const PickerSectionOptions({
    required this.items,
    required this.selectedItems,
    required this.onOptionTap,
    required this.selectedColor,
    super.key,
  });

  /// @no-doc
  final List<PickerSectionOptionItemData> items;

  /// @no-doc
  final List<PickerSectionOptionItemData> selectedItems;

  /// @no-doc
  final void Function(PickerSectionOptionItemData) onOptionTap;

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
          PickerSectionOptionsItem(
            item: items[i],
            onOptionTap: onOptionTap,
            isSelected: selectedItems.contains(items[i]),
            selectedColor: selectedColor,
          ),
      ],
    );
  }
}

/// @no-doc
class PickerSectionOptionsItem extends StatelessWidget {
  /// @no-doc
  const PickerSectionOptionsItem({
    required this.item,
    required this.onOptionTap,
    required this.isSelected,
    required this.selectedColor,
    super.key,
  });

  /// @no-doc
  final PickerSectionOptionItemData item;

  /// @no-doc
  final bool isSelected;

  /// @no-doc
  final void Function(PickerSectionOptionItemData) onOptionTap;

  /// @no-doc
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onOptionTap(item),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? selectedColor : Colors.grey,
          ),
        ),
        //width: 20,
        //height: 20,
        child: Center(
          child: Text(
            item.name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
