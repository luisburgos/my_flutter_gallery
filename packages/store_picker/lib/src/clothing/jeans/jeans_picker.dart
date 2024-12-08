import 'package:flutter/material.dart';
import 'package:store_picker/src/clothing/jeans/jeans_picker_data.dart';
import 'package:store_picker/src/engine/picker_engine.dart';
import 'package:store_picker/src/shared/picker_engine_helpers.dart';
import 'package:store_picker/src/stores/providers.dart';
import 'package:store_picker/src/stores/views/stores_state_consumer_widget.dart';

/// @no-doc
class JeansPickerWidget extends StatefulWidget {
  /// @no-doc
  const JeansPickerWidget({
    this.id = 'jeans-01',
    super.key,
  });

  /// @no-doc
  final String id;

  @override
  State<JeansPickerWidget> createState() => _JeansPickerWidgetState();
}

class _JeansPickerWidgetState extends State<JeansPickerWidget> {
  late Map<String, List<PickerEngineItem>> _selected;

  String get waistSectionId => '${widget.id}-waist';
  String get legSectionId => '${widget.id}-leg';

  @override
  void initState() {
    _selected = {
      waistSectionId: [],
      legSectionId: [],
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final is28 = _selected[waistSectionId]?.contains(jeanWaistSize28) ?? false;
    final is31 = _selected[waistSectionId]?.contains(jeanWaistSize31) ?? false;

    var legItems = [
      jeanLegSize30,
      jeanLegSize32,
    ];

    if (is28) {
      legItems = [
        jeanLegSize34,
      ];
    }

    if (is31) {
      legItems = [
        jeanLegSize34,
        jeanLegSize32,
      ];
    }

    return StoresStateConsumerWidget(
      builder: (storesState, __) => PickerEngineWidget(
        key: Key(widget.id),
        color: storesState.getBrandColor(context),
        iconDataLocator: faIconNameMapping,
        onStateChanged: (state) {},
        sections: [
          PickerEngineSection(
            id: waistSectionId,
            title: 'Elige un WAIST',
            //initialSelection: _selected[waistSectionId],
            options: const [
              jeanWaistSize28,
              jeanWaistSize31,
              jeanWaistSize32,
            ],
            onSelectedChanged: (selected) {
              setState(() {
                _selected[waistSectionId] = selected;
              });
            },
          ),
          PickerEngineSection(
            id: legSectionId,
            title: 'Elige un LEG LENGTH',
            options: legItems,
          ),
        ],
      ),
    );
  }
}
