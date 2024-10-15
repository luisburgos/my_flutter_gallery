import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';

/// @no-doc
class JeansPickerWidget extends StatefulWidget {
  /// @no-doc
  const JeansPickerWidget({
    super.key,
  });

  @override
  State<JeansPickerWidget> createState() => _JeansPickerWidgetState();
}

class _JeansPickerWidgetState extends State<JeansPickerWidget> {
  PickOMaticSectionOption? initialSelection = const PickOMaticSectionOption(
    name: 'BLUE',
    iconName: '',
    priceTag: '',
  );

  @override
  Widget build(BuildContext context) {
    const id = 'jeans-01';

    var items = [
      const PickOMaticItem(
        id: PickOMaticItemId('30'),
        name: '30',
        price: 0,
        iconName: '',
      ),
      const PickOMaticItem(
        id: PickOMaticItemId('32'),
        name: '32',
        price: 0,
        iconName: '',
      ),
    ];
    if (initialSelection?.name == '28') {
      items = [
        const PickOMaticItem(
          id: PickOMaticItemId('34'),
          name: '34',
          price: 0,
          iconName: '',
        ),
      ];
    }

    if (initialSelection?.name == '31') {
      items = [
        const PickOMaticItem(
          id: PickOMaticItemId('34'),
          name: '34',
          price: 0,
          iconName: '',
        ),
        const PickOMaticItem(
          id: PickOMaticItemId('32'),
          name: '32',
          price: 0,
          iconName: '',
        ),
      ];
    }

    return PickOMaticWidget(
      key: const Key(id),
      sections: [
        PickOMaticSectionWrapper.build(
          id: '$id-waist',
          title: 'Elige un WAIST',
          initialSelection: initialSelection,
          items: const [
            PickOMaticItem(
              id: PickOMaticItemId('28'),
              name: '28',
              price: 0,
              iconName: '',
            ),
            PickOMaticItem(
              id: PickOMaticItemId('31'),
              name: '31',
              price: 0,
              iconName: '',
            ),
            PickOMaticItem(
              id: PickOMaticItemId('32'),
              name: '32',
              price: 0,
              iconName: '',
            ),
          ],
          onSelected: (color) {
            setState(() {
              initialSelection = color;
            });
          },
        ),
        PickOMaticSectionWrapper.build(
          id: '$id-leg',
          title: 'Elige un LEG LENGHT',
          items: items,
        ),
      ],
    );
  }
}
