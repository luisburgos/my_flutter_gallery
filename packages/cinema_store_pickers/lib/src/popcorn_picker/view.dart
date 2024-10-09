import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/widgets/cinema_branch_selector.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:cinema_store_pickers/src/shared/picker_selection_preview.dart';
import 'package:cinema_store_pickers/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornPickerWidget extends ConsumerStatefulWidget {
  /// @no-doc
  const PopcornPickerWidget({super.key});

  @override
  PopcornPickerWidgetState createState() => PopcornPickerWidgetState();
}

/// @no-doc
class PopcornPickerWidgetState extends ConsumerState<PopcornPickerWidget> {
  @override
  void initState() {
    ref.read(popcornPickerNotifierProvider.notifier).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);
    final theme = Theme.of(context);
    final brandColor = theme.colorScheme.primary;
    if (popcornPicker.brandHexColor != null) {
      //brandColor = hexToColor(popcornFlavorPicker.brandHexColor!);
    }

    final pickerSelectedFlavors = {
      for (final item in popcornPicker.selectedFlavors)
        PickerSectionOptionItemData(
          name: item.name,
        ): item,
    };

    final pickerSelectedSize = {
      PickerSectionOptionItemData(
        name: popcornPicker.selectedSize!.name,
      ): popcornPicker.selectedSize,
    };

    final pickerFlavorOptions = {
      for (final item in popcornPicker.flavorOptions)
        PickerSectionOptionItemData(
          name: item.name,
        ): item,
    };

    final pickerSizeOptions = {
      for (final item in popcornPicker.sizeOptions)
        PickerSectionOptionItemData(
          name: item.name,
        ): item,
    };

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CinemaBranchSelector(
              options: popcornPicker.cinemaOptions,
              selectedCinema: popcornPicker.selectedCinema!,
              onSetSelectedCinema: (_) {
                ref
                    .read(popcornPickerNotifierProvider.notifier)
                    .setSelectedCinemaBranch(_.id);
              },
              color: brandColor,
            ),
          ),
          PickerSectionTitle(
            'Elige el tamaño de tus palomitas',
            color: brandColor,
          ),
          SizedBox(
            height: 120,
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
          PickerSectionTitle(
            'Elige hasta ${popcornPicker.selectionLimit}'
            ' sabores para tus palomitas',
            color: brandColor,
          ),
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
          SizedBox(
            height: 280,
            child: PickerSectionOptions(
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
            ),
          ),
        ],
      ),
    );
  }
}
