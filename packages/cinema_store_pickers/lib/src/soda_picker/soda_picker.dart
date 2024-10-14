import 'package:cinema_store_pickers/src/data/fake_customization_sections.dart';
import 'package:cinema_store_pickers/src/shared/base_cinema_picker.dart';
import 'package:flutter/material.dart';

/// @no-doc
class SodaPickerWidget extends StatelessWidget {
  /// @no-doc
  const SodaPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseCinemaPickerWidget(
      sections: [
        sodaSizeSection,
        sodaFlavorSection,
        sodaIceSection,
      ],
    );
  }
}
