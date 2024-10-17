import 'package:cinema_store_pickers/src/cinema/soda/fake_soda.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';

/// @no-doc
class SodaPickerWidget extends StatefulWidget {
  /// @no-doc
  const SodaPickerWidget({super.key});

  @override
  State<SodaPickerWidget> createState() => _SodaPickerWidgetState();
}

class _SodaPickerWidgetState extends State<SodaPickerWidget> {
  @override
  Widget build(BuildContext context) {
    const id = 'soda-01';

    return PickOMaticWidget(
      key: const Key(id),
      sections: [
        PickOMaticSectionWrapper.build(
          id: '$id-size',
          title: 'Elige un tamaño',
          items: sodaSizes.values.toList(),
        ),
        PickOMaticSectionWrapper.build(
          id: '$id-flavor',
          title: 'Elige un sabor',
          items: [
            sodaFlavor1,
            sodaFlavor2,
            sodaFlavor3,
            sodaFlavor4,
          ],
        ),
        PickOMaticSectionWrapper.build(
          id: '$id-ice',
          title: 'Elige cantidad de hielo',
          items: [
            itemIce1,
            itemIce2,
            itemIce3,
          ],
        ),
      ],
    );
  }
}
