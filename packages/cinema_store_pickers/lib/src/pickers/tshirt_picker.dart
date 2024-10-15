import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';

/// @no-doc
class TShirtPickerWidget extends StatefulWidget {
  /// @no-doc
  const TShirtPickerWidget({
    super.key,
  });

  @override
  State<TShirtPickerWidget> createState() => _TShirtPickerWidgetState();
}

class _TShirtPickerWidgetState extends State<TShirtPickerWidget> {
  PickOMaticSectionOption? selectedColor = const PickOMaticSectionOption(
    name: 'BLUE',
    iconName: '',
    priceTag: '',
  );

  @override
  Widget build(BuildContext context) {
    const id = 'tshirt-01';

    return PickOMaticWidget(
      key: const Key(id),
      sections: [
        PickOMaticSectionWrapper.build(
          id: '$id-size',
          title: 'Elige un color',
          initialSelection: selectedColor,
          items: const [
            PickOMaticItem(
              id: PickOMaticItemId('blue'),
              name: 'BLUE',
              price: 0,
              iconName: '',
            ),
            PickOMaticItem(
              id: PickOMaticItemId('white'),
              name: 'WHITE',
              price: 0,
              iconName: '',
            ),
          ],
          onSelected: (color) {
            print('selectedColor: $selectedColor');
            setState(() {
              selectedColor = color;
            });
          },
        ),
        PickOMaticSectionWrapper.build(
          id: '$id-flavor',
          title: 'Elige un tamaño',
          items: [
            const PickOMaticItem(
              id: PickOMaticItemId('s'),
              name: 'S',
              iconName: '',
            ),
            if (selectedColor?.name == 'WHITE')
              const PickOMaticItem(
                id: PickOMaticItemId('m'),
                name: 'M',
                iconName: '',
              ),
            const PickOMaticItem(
              id: PickOMaticItemId('g'),
              name: 'G',
              iconName: '',
            ),
          ],
        ),
      ],
    );
  }
}
