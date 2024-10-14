import 'package:cinema_store_pickers/src/models/customization_section.dart';
import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:cinema_store_pickers/src/shared/base_cinema_picker.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PopcornPickerWidget extends StatelessWidget {
  /// @no-doc
  const PopcornPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCinemaPickerWidget.builder(
      sectionsBuilder: (state) {
        return [
          CustomizationSection<ItemSize>(
            id: 'popcorn-size-section-01',
            title: 'Elige un tamaño',
            options: state.selectedCinema?.availablePopcornSizes
                    .map(CustomizationSectionOption.new)
                    .toList() ??
                const [],
          ),
          CustomizationSection<ItemFlavor>(
            id: 'popcorn-flavor-section-01',
            title: 'Elige un sabor',
            selectionMode: const MultipleCustomizationSectionSelectionMode(2),
            options: state.selectedCinema?.availablePopcornFlavors
                    .map(CustomizationSectionOption.new)
                    .toList() ??
                const [],
          ),
        ];
      },
    );
  }
}
