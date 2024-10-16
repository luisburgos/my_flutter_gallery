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

/// @no-doc
const _white = PickOMaticItem(
  id: PickOMaticItemId('white'),
  name: 'WHITE',
  price: 0,
  iconName: '',
);

/// @no-doc
const _blue = PickOMaticItem(
  id: PickOMaticItemId('blue'),
  name: 'BLUE',
  price: 0,
  iconName: '',
);

/// @no-doc
const _blueOption = PickOMaticItem(
  id: PickOMaticItemId('blue'),
  name: 'BLUE',
  iconName: '',
  price: 0,
);

/// @no-doc
const _sizeS = PickOMaticItem(
  id: PickOMaticItemId('s'),
  name: 'S',
  iconName: '',
);

/// @no-doc
const _sizeM = PickOMaticItem(
  id: PickOMaticItemId('m'),
  name: 'M',
  iconName: '',
);

/// @no-doc
const _sizeG = PickOMaticItem(
  id: PickOMaticItemId('g'),
  name: 'G',
  iconName: '',
);

class _TShirtPickerWidgetState extends State<TShirtPickerWidget> {
  var _selected = [_blueOption];

  @override
  Widget build(BuildContext context) {
    const id = 'tshirt-01';

    final isWhite = _selected.contains(
      const PickOMaticItem(
        id: PickOMaticItemId('white'),
        name: 'WHITE',
        iconName: '',
        price: 0,
      ),
    );
    var items = [_sizeS, _sizeG];
    if (isWhite) {
      items = [
        _sizeS,
        _sizeM,
        _sizeG,
      ];
    }

    return PickOMaticWidget(
      key: const Key(id),
      sections: [
        PickOMaticSectionWrapper.build(
          id: '$id-size',
          title: 'Elige un color',
          initialSelection: _selected,
          items: const [
            _blue,
            _white,
          ],
          onSelectedChanged: (selected) {
            setState(() {
              _selected = selected;
            });
          },
        ),
        PickOMaticSectionWrapper.build(
          id: '$id-flavor',
          title: 'Elige un tamaño',
          items: items,
        ),
      ],
    );
  }
}
