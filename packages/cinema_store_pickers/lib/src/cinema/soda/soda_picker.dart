import 'package:cinema_store_pickers/src/cinema/soda/soda_picker_data.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:cinema_store_pickers/src/stores/providers.dart';
import 'package:cinema_store_pickers/src/stores/views/stores_state_consumer_widget.dart';
import 'package:flutter/material.dart';

/// @no-doc
class SodaPickerWidget extends StatefulWidget {
  /// @no-doc
  const SodaPickerWidget({
    this.id = 'soda-01',
    super.key,
  });

  /// @no-doc
  final String id;

  @override
  State<SodaPickerWidget> createState() => _SodaPickerWidgetState();
}

class _SodaPickerWidgetState extends State<SodaPickerWidget> {
  late Map<String, List<PickOMaticItem>> _selected;

  String get sizeSectionId => '${widget.id}-size';
  String get flavorSectionId => '${widget.id}-flavor';
  String get iceSectionId => '${widget.id}-ice';

  @override
  void initState() {
    _selected = {
      sizeSectionId: [],
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            id: sizeSectionId,
            title: 'Elige un tamaño',
            items: sodaSizes.values.toList(),
            onSelectedChanged: (selected) {
              setState(() {
                _selected[sizeSectionId] = selected;
              });
            },
          ),
          PickOMaticSectionWrapper.build(
            id: flavorSectionId,
            title: 'Elige un sabor',
            items: [
              sodaFlavor1,
              sodaFlavor2,
              sodaFlavor3,
              sodaFlavor4,
            ],
          ),
          PickOMaticSectionWrapper.build(
            id: iceSectionId,
            title: 'Elige cantidad de hielo',
            items: [
              itemIce1,
              itemIce2,
              itemIce3,
            ],
          ),
        ],
      ),
    );
  }
}
