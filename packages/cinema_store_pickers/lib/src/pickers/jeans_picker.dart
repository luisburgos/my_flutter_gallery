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
  var _selected = [
    const PickOMaticItem(
      id: PickOMaticItemId('BLUE'),
      name: 'BLUE',
      iconName: '',
      price: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const id = 'jeans-01';

    final is28 = _selected.contains(
      const PickOMaticItem(
        id: PickOMaticItemId('28'),
        name: '28',
        iconName: '',
        price: 0,
      ),
    );

    final is31 = _selected.contains(
      const PickOMaticItem(
        id: PickOMaticItemId('31'),
        name: '31',
        iconName: '',
        price: 0,
      ),
    );

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
    if (is28) {
      items = [
        const PickOMaticItem(
          id: PickOMaticItemId('34'),
          name: '34',
          price: 0,
          iconName: '',
        ),
      ];
    }

    if (is31) {
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
          initialSelection: _selected,
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
          onSelectedChanged: (selected) {
            setState(() {
              _selected = selected;
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
