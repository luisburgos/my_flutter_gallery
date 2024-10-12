import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:cinema_store_pickers/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';

/// @no-doc
class PopcornSizeSelector extends ConsumerWidget {
  /// @no-doc
  const PopcornSizeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);

    final popcornSelectedSize = popcornPicker.selectedSize!;
    final pickerSelectedSize = {
      PickerSectionOptionItemData(
        name: popcornSelectedSize.name,
        iconName: popcornSelectedSize.iconName,
        priceTag: Money.fromNum(
          popcornSelectedSize.price,
          isoCode: 'MXN',
          decimalDigits: 2,
        ).toString(),
      ): popcornPicker.selectedSize,
    };
    final pickerSizeOptions = {
      for (final item in popcornPicker.sizeOptions)
        PickerSectionOptionItemData(
          name: item.name,
          iconName: item.iconName,
          priceTag: Money.fromNum(
            item.price,
            isoCode: 'MXN',
            decimalDigits: 2,
          ).toString(),
        ): item,
    };

    final brandColor = cinemaStore.getBrandColor(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PickerSectionTitle(
          'Elige un tamaño',
          color: brandColor,
        ),
        const SizedBox(height: 12),
        PickerSectionOptions(
          items: pickerSizeOptions.keys.toList(),
          selectedItems: pickerSelectedSize.keys.toList(),
          onOptionTap: (option) {
            final value = pickerSizeOptions[option];
            if (value != null) {
              ref
                  .read(popcornPickerNotifierProvider.notifier)
                  .toggleSelectedSize(value);
            }
          },
          selectedColor: brandColor,
        ),
      ],
    );
  }
}
