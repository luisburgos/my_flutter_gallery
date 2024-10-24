import 'package:flutter/material.dart';
import 'package:store_picker/src/engine/models/models.dart';

/// @no-doc
class PickerEngineItemView extends StatelessWidget {
  /// @no-doc
  const PickerEngineItemView({
    required this.item,
    required this.onOptionTap,
    required this.isSelected,
    required this.selectedColor,
    required this.iconDataLocator,
    super.key,
  });

  /// @no-doc
  final PickerEngineItem item;

  /// @no-doc
  final bool isSelected;

  /// @no-doc
  final void Function(PickerEngineItem) onOptionTap;

  /// @no-doc
  final Color selectedColor;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onOptionTap(item),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? selectedColor : Colors.grey.shade400,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (item.iconName != null)
              Icon(
                iconDataLocator(item.iconName!),
                size: 16,
              ),
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            if ((item.price ?? 0) > 0)
              Text(
                '\$${item.price}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
