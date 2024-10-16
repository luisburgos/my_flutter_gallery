import 'package:cinema_store_pickers/src/pickomatic/helpers.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_utils/shared_utils.dart';

const _minHeight = 40.0;

/// @no-doc
class PickOMaticSelectionPreview extends StatelessWidget {
  /// @no-doc
  const PickOMaticSelectionPreview({
    required this.items,
    required this.onRemoveTap,
    super.key,
  });

  /// @no-doc
  final List<PickOMaticSectionOption> items;

  /// @no-doc
  final void Function(PickOMaticSectionOption) onRemoveTap;

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
  final PickOMaticSectionOption item;

  /// @no-doc
  final bool displayRemoveButton;

  /// @no-doc
  final void Function(PickOMaticSectionOption) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.secondary.withAlpha(30),
      height: _minHeight,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FaIcon(
                faIconNameMapping(item.iconName),
                size: 16,
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
                  size: 12,
                ),
                onPressed: () => onRemoveTap(item),
              ),
            ),
        ],
      ),
    );
  }
}
