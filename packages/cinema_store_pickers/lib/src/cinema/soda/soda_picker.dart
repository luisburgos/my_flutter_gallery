import 'package:cinema_store_pickers/src/cinema/soda/soda_picker_data.dart';
import 'package:cinema_store_pickers/src/engine/picker_engine.dart';
import 'package:cinema_store_pickers/src/shared/picker_engine_helpers.dart';
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
  late Map<String, List<PickerEngineItem>> _selected;

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
      builder: (storesState, __) => PickerEngineWidget(
        key: Key(widget.id),
        color: storesState.getBrandColor(context),
        iconDataLocator: faIconNameMapping,
        //selections: selections,
        sections: [
          PickerEngineSectionWrapper.build(
            id: sizeSectionId,
            title: 'Elige un tamaño',
            items: sodaSizes.values.toList(),
            onSelectedChanged: (selected) {
              setState(() {
                _selected[sizeSectionId] = selected;
              });
            },
          ),
          PickerEngineSectionWrapper.build(
            id: flavorSectionId,
            title: 'Elige un sabor',
            items: [
              sodaFlavor1,
              sodaFlavor2,
              sodaFlavor3,
              sodaFlavor4,
            ],
          ),
          PickerEngineSectionWrapper.build(
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
