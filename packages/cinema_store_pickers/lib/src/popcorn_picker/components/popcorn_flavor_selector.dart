import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/models/item_flavor.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:cinema_store_pickers/src/shared/picker_selection_preview.dart';
import 'package:cinema_store_pickers/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';

/// @no-doc
class PopcornFlavorSelector extends ConsumerWidget {
  /// @no-doc
  const PopcornFlavorSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);

    final popcornSelectedSize = popcornPicker.selectedSize;
    final pickerSelectedFlavors = {
      for (final item in popcornPicker.selectedFlavors)
        PickerSectionOptionItemData(
          name: item.name,
          iconName: item.iconName,
          priceTag: Money.fromNum(
            (item.price as MultipleItemPrice).prices[popcornSelectedSize?.id] ??
                0.0,
            isoCode: 'MXN',
            decimalDigits: 2,
          ).toString(),
        ): item,
    };

    final pickerFlavorOptions = {
      for (final item in popcornPicker.flavorOptions)
        PickerSectionOptionItemData(
          name: item.name,
          iconName: item.iconName,
          priceTag: Money.fromNum(
            (item.price as MultipleItemPrice).prices[popcornSelectedSize?.id] ??
                0.0,
            isoCode: 'MXN',
            decimalDigits: 2,
          ).toString(),
        ): item,
    };

    final brandColor = cinemaStore.getBrandColor(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*PickerSectionTitle(
          'Elige hasta ${popcornPicker.selectionLimit}'
          ' sabores para tus palomitas',
          color: brandColor,
        ),*/
        PickerSectionTitle(
          'Elige el sabor',
          color: brandColor,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: PickerSelectionPreview(
            items: pickerSelectedFlavors.keys.toList(),
            onRemoveTap: (option) {
              final value = pickerFlavorOptions[option];
              if (value != null) {
                ref
                    .read(popcornPickerNotifierProvider.notifier)
                    .toggleSelectedFlavor(value);
              }
            },
          ),
        ),
        const SizedBox(height: 12),
        PickerSectionOptions(
          items: pickerFlavorOptions.keys.toList(),
          selectedItems: pickerSelectedFlavors.keys.toList(),
          onOptionTap: (option) {
            final value = pickerFlavorOptions[option];
            if (value != null) {
              ref
                  .read(popcornPickerNotifierProvider.notifier)
                  .toggleSelectedFlavor(value);
            }
          },
          selectedColor: brandColor,
        )
      ],
    );
  }
}
