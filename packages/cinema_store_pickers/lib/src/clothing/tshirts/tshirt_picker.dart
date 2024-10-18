import 'package:cinema_store_pickers/src/clothing/tshirts/tshirt_picker_data.dart';
import 'package:cinema_store_pickers/src/engine/picker_engine.dart';
import 'package:cinema_store_pickers/src/shared/picker_engine_helpers.dart';
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
  /// @no-doc
  String get colorSectionId => '${widget.id}-color';

  /// @no-doc
  String get sizeSectionId => '${widget.id}-size';

  List<PickerEngineItem> sizeItems = [];

  @override
  Widget build(BuildContext context) {
    return StoresStateConsumerWidget(
      builder: (storesState, __) => PickerEngineWidget(
        key: Key(widget.id),
        color: storesState.getBrandColor(context),
        iconDataLocator: faIconNameMapping,
        onStateChanged: (state) {
          print('state: $state');
          if (state.selections.isEmpty) return;

          final isWhite =
              state.selections[colorSectionId]?.contains(tShirtWhiteColor) ??
                  false;
          setState(() {
            sizeItems = [tShirtSizeS, tShirtSizeG];
            if (isWhite) {
              sizeItems = [
                tShirtSizeS,
                tShirtSizeM,
                tShirtSizeG,
              ];
            }
          });
        },
        sections: [
          PickerEngineSection(
            id: colorSectionId,
            title: 'Elige un color',
            options: const [
              tShirtBlueColor,
              tShirtWhiteColor,
            ],
          ),
          if (sizeItems.isNotEmpty)
            PickerEngineSection(
              id: sizeSectionId,
              title: 'Elige un tamaño',
              options: sizeItems,
            ),
        ],
      ),
    );
  }
}
