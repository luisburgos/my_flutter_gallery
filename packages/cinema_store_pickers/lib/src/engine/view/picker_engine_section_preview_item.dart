import 'package:cinema_store_pickers/src/engine/models/models.dart';
import 'package:flutter/material.dart';

const _minHeight = 40.0;

/// @no-doc
class PickerSelectionPreviewItem extends StatelessWidget {
  /// @no-doc
  const PickerSelectionPreviewItem({
    required this.item,
    required this.onRemoveTap,
    required this.iconDataLocator,
    this.displayRemoveButton = true,
    super.key,
  });

  /// @no-doc
  final PickerEngineItem item;

  /// @no-doc
  final bool displayRemoveButton;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  /// @no-doc
  final void Function(PickerEngineItem) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.secondary.withAlpha(30),
      height: _minHeight,
      child: Stack(
        children: [
          if (item.iconName != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  iconDataLocator(item.iconName!),
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
