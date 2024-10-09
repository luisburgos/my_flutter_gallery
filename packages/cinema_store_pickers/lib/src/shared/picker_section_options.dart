import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:flutter/material.dart';

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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 6,
      ),
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isSelected = selectedItems.contains(item);
        print(
            'selectedItems.contains(item): $selectedItems contains $item is $isSelected');
        return PickerSectionOptionsItem(
          item: item,
          onOptionTap: onOptionTap,
          isSelected: isSelected,
          selectedColor: selectedColor,
        );
      },
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
        width: 20,
        height: 20,
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
