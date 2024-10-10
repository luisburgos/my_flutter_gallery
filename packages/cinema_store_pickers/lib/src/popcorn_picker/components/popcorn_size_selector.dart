import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:cinema_store_pickers/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornSizeSelector extends ConsumerWidget {
  /// @no-doc
  const PopcornSizeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);

    final pickerSelectedSize = {
      PickerSectionOptionItemData(
        name: popcornPicker.selectedSize!.name,
      ): popcornPicker.selectedSize,
    };
    final pickerSizeOptions = {
      for (final item in popcornPicker.sizeOptions)
        PickerSectionOptionItemData(
          name: item.name,
        ): item,
    };

    final brandColor = popcornPicker.getBrandColor(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PickerSectionTitle(
          'Elige un tamaño',
          color: brandColor,
        ),
        SizedBox(
          //height: 120,
          child: PickerSectionOptions(
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
        ),
      ],
    );
  }
}
