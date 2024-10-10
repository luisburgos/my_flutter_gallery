import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:shared_utils/shared_utils.dart';

/// @no-doc
class PickerSelectionPreview extends StatelessWidget {
  /// @no-doc
  const PickerSelectionPreview({
    required this.items,
    required this.onRemoveTap,
    super.key,
  });

  /// @no-doc
  final List<PickerSectionOptionItemData> items;

  /// @no-doc
  final void Function(PickerSectionOptionItemData) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: Colors.grey.shade200,
        width: double.infinity,
        height: 20,
      );
    }

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
          PickerSelectionPreviewItem(
            item: items[i],
            onRemoveTap: onRemoveTap,
            displayRemoveButton: items.length > 1,
          ),
      ],
    );
  }
}

/// @no-doc
class PickerSelectionPreviewItem extends StatelessWidget {
  /// @no-doc
  const PickerSelectionPreviewItem({
    required this.item,
    required this.onRemoveTap,
    this.displayRemoveButton = true,
    super.key,
  });

  /// @no-doc
  final PickerSectionOptionItemData item;

  /// @no-doc
  final bool displayRemoveButton;

  /// @no-doc
  final void Function(PickerSectionOptionItemData) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.secondary.withAlpha(30),
      child: Stack(
        children: [
          Center(
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          if (displayRemoveButton)
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () => onRemoveTap(item),
              ),
            ),
        ],
      ),
    );
  }
}
