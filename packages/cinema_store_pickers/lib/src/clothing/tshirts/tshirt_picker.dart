import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';

/// @no-doc
class TShirtPickerWidget extends StatefulWidget {
  /// @no-doc
  const TShirtPickerWidget({
    super.key,
    this.id = 'tshirt-01',
  });

  /// @no-doc
  final String id;

  @override
  State<TShirtPickerWidget> createState() => _TShirtPickerWidgetState();
}

/// @no-doc
const _white = PickOMaticItem(
  id: PickOMaticItemId('white'),
  name: 'WHITE',
  price: 270,
  iconName: '',
);

/// @no-doc
const _blue = PickOMaticItem(
  id: PickOMaticItemId('blue'),
  name: 'BLUE',
  price: 270,
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
  price: 10,
);

/// @no-doc
const _sizeM = PickOMaticItem(
  id: PickOMaticItemId('m'),
  name: 'M',
  iconName: '',
  price: 15,
);

/// @no-doc
const _sizeG = PickOMaticItem(
  id: PickOMaticItemId('g'),
  name: 'G',
  iconName: '',
  price: 20,
);

class _TShirtPickerWidgetState extends State<TShirtPickerWidget> {
  late Map<String, List<PickOMaticItem>> _selected;

  String get colorSectionId => '${widget.id}-color';
  String get sizeSectionId => '${widget.id}-size';

  @override
  void initState() {
    _selected = {
      colorSectionId: [_blueOption],
      sizeSectionId: [],
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isWhite = _selected[colorSectionId]?.contains(
          const PickOMaticItem(
            id: PickOMaticItemId('white'),
            name: 'WHITE',
            iconName: '',
            price: 0,
          ),
        ) ??
        false;
    var items = [_sizeS, _sizeG];
    if (isWhite) {
      items = [
        _sizeS,
        _sizeM,
        _sizeG,
      ];
    }

    final selections = _selected.values.reduce(
      (value, element) => [...value, ...element],
    );

    return PickOMaticWidget(
      key: Key(widget.id),
      selections: selections,
      sections: [
        PickOMaticSectionWrapper.build(
          id: colorSectionId,
          title: 'Elige un color',
          initialSelection: _selected[colorSectionId],
          items: const [
            _blue,
            _white,
          ],
          onSelectedChanged: (selected) {
            setState(() {
              _selected[colorSectionId] = selected;
            });
          },
        ),
        PickOMaticSectionWrapper.build(
          id: sizeSectionId,
          title: 'Elige un tamaño',
          items: items,
          onSelectedChanged: (selected) {
            setState(() {
              _selected[sizeSectionId] = selected;
            });
          },
        ),
      ],
    );
  }
}
