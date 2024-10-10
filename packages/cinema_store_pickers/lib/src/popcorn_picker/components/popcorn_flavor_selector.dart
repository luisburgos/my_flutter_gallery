import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:cinema_store_pickers/src/shared/picker_selection_preview.dart';
import 'package:cinema_store_pickers/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornFlavorSelector extends ConsumerWidget {
  /// @no-doc
  const PopcornFlavorSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);

    final pickerSelectedFlavors = {
      for (final item in popcornPicker.selectedFlavors)
        PickerSectionOptionItemData(
          name: item.name,
          iconName: item.iconName,
          priceTag: r'$0.00',
        ): item,
    };

    final pickerFlavorOptions = {
      for (final item in popcornPicker.flavorOptions)
        PickerSectionOptionItemData(
          name: item.name,
          iconName: item.iconName,
          priceTag: r'$0.00',
        ): item,
    };

    final brandColor = popcornPicker.getBrandColor(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PickerSectionTitle(
          'Elige hasta ${popcornPicker.selectionLimit}'
          ' sabores para tus palomitas',
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
