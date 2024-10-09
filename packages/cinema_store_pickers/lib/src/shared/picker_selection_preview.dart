import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        color: Colors.grey.shade300,
        width: double.infinity,
        height: 20,
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: items.isEmpty ? 1 : items.length,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 12 / items.length,
      ),
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PickerSelectionPreviewItem(
          item: items[index],
          onRemoveTap: onRemoveTap,
          displayRemoveButton: items.length > 1,
        );
      },
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
