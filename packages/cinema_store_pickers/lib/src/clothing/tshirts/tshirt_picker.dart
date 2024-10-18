import 'package:cinema_store_pickers/src/clothing/tshirts/tshirt_picker_data.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:cinema_store_pickers/src/stores/providers.dart';
import 'package:cinema_store_pickers/src/stores/views/stores_state_consumer_widget.dart';
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

class _TShirtPickerWidgetState extends State<TShirtPickerWidget> {
  late Map<String, List<PickOMaticItem>> _selected;

  String get colorSectionId => '${widget.id}-color';
  String get sizeSectionId => '${widget.id}-size';

  @override
  void initState() {
    _selected = {
      colorSectionId: [tShirtBlueColor],
      sizeSectionId: [],
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isWhite =
        _selected[colorSectionId]?.contains(tShirtWhiteColor) ?? false;
    var sizeItems = [tShirtSizeS, tShirtSizeG];
    if (isWhite) {
      sizeItems = [
        tShirtSizeS,
        tShirtSizeM,
        tShirtSizeG,
      ];
    }

    final selections = _selected.values.reduce(
      (value, element) => [...value, ...element],
    );

    return StoresStateConsumerWidget(
      builder: (storesState, __) => PickOMaticWidget(
        key: Key(widget.id),
        color: storesState.getBrandColor(context),
        selections: selections,
        sections: [
          PickOMaticSectionWrapper.build(
            id: colorSectionId,
            title: 'Elige un color',
            initialSelection: _selected[colorSectionId],
            items: const [
              tShirtBlueColor,
              tShirtWhiteColor,
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
            items: sizeItems,
            onSelectedChanged: (selected) {
              setState(() {
                _selected[sizeSectionId] = selected;
              });
            },
          ),
        ],
      ),
    );
  }
}
