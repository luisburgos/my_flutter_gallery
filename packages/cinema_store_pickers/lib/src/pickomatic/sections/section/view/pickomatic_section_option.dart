import 'package:cinema_store_pickers/src/pickomatic/helpers.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/section/models/section_option.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// @no-doc
class PickerSectionOptionView extends StatelessWidget {
  /// @no-doc
  const PickerSectionOptionView({
    required this.item,
    required this.onOptionTap,
    required this.isSelected,
    required this.selectedColor,
    super.key,
  });

  /// @no-doc
  final PickOMaticSectionOption item;

  /// @no-doc
  final bool isSelected;

  /// @no-doc
  final void Function(PickOMaticSectionOption) onOptionTap;

  /// @no-doc
  final Color selectedColor;

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
            FaIcon(
              faIconNameMapping(item.iconName),
              size: 16,
            ),
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            if (item.priceTag.isNotEmpty)
              Text(
                item.priceTag,
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
