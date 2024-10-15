import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';

/// @no-doc
class StoreItemPickerWidget extends StatelessWidget {
  /// @no-doc
  const StoreItemPickerWidget({
    required this.storeItem,
    this.withPreview = false,
    super.key,
  });

  /// @no-doc
  final StoreItem storeItem;

  /// @no-doc
  final bool withPreview;

  @override
  Widget build(BuildContext context) {
    return PickOMaticWidget(
      key: Key('store-item-${storeItem.id}'),
      sections: [
        PickOMaticSectionWrapper.build(
          id: '${storeItem.id}-size',
          title: 'Elige un tamaño',
          items: storeItem.possibleSizes,
        ),
        PickOMaticSectionWrapper.build(
          id: '${storeItem.id}-flavor',
          title: 'Elige un sabor',
          items: storeItem.possibleVariants,
          withPreview: withPreview,
          selectionLimit: 4,
        ),
      ],
    );
  }
}
