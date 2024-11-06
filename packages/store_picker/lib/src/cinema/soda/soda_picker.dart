import 'package:flutter/material.dart';
import 'package:store_picker/src/cinema/soda/soda_picker_data.dart';
import 'package:store_picker/src/engine/picker_engine.dart';
import 'package:store_picker/src/shared/picker_engine_helpers.dart';
import 'package:store_picker/src/stores/providers.dart';
import 'package:store_picker/src/stores/views/stores_state_consumer_widget.dart';

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
    /*final selections = _selected.values.reduce(
      (value, element) => [...value, ...element],
    );*/

    return StoresStateConsumerWidget(
      builder: (storesState, __) => PickerEngineWidget(
        key: Key(widget.id),
        color: storesState.getBrandColor(context),
        iconDataLocator: faIconNameMapping,
        onStateChanged: (state) {},
        sections: [
          PickerEngineSection(
            id: sizeSectionId,
            title: 'Elige un tamaño',
            options: sodaSizes.values.toList(),
            onSelectedChanged: (selected) {
              setState(() {
                _selected[sizeSectionId] = selected;
              });
            },
          ),
          PickerEngineSection(
            id: flavorSectionId,
            title: 'Elige un sabor',
            options: [
              sodaFlavor1,
              sodaFlavor2,
              sodaFlavor3,
              sodaFlavor4,
            ],
          ),
          PickerEngineSection(
            id: iceSectionId,
            title: 'Elige cantidad de hielo',
            options: [
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
