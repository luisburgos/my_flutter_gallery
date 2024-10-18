import 'package:cinema_store_pickers/src/cinema/popcorn/popcorn_picker_data.dart';
import 'package:cinema_store_pickers/src/engine/picker_engine.dart';
import 'package:cinema_store_pickers/src/shared/picker_engine_helpers.dart';
import 'package:cinema_store_pickers/src/stores/providers.dart';
import 'package:cinema_store_pickers/src/stores/views/stores_state_consumer_widget.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PopcornPickerWidget extends StatefulWidget {
  /// @no-doc
  const PopcornPickerWidget({
    super.key,
    this.initialSelectionLimit = 2,
    this.id = 'popcorn-01',
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final int initialSelectionLimit;

  @override
  State<PopcornPickerWidget> createState() => _PopcornPickerWidgetState();
}

class _PopcornPickerWidgetState extends State<PopcornPickerWidget> {
  late int selectionLimit;
  late Map<String, List<PickerEngineItem>> _selected;

  String get sizeSectionId => '${widget.id}-size';
  String get flavorSectionId => '${widget.id}-flavor';

  @override
  void initState() {
    _selected = {
      flavorSectionId: [],
      sizeSectionId: [
        popcornSizes[popcornSizeSmallId]!,
      ],
    };
    selectionLimit = widget.initialSelectionLimit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const id = 'popcorn-01';

    final selections = _selected.values.reduce(
      (value, element) => [...value, ...element],
    );

    final selectedSize = _selected[sizeSectionId]?.first.id.value ?? '';

    return StoresStateConsumerWidget(
      builder: (storesState, __) => PickerEngineWidget(
        key: const Key(id),
        color: storesState.getBrandColor(context),
        iconDataLocator: faIconNameMapping,
        selections: selections,
        sections: [
          PickerEngineSectionWrapper.build(
            id: sizeSectionId,
            title: 'Elige un tamaño',
            items: popcornSizes.values.toList(),
            initialSelection: [],
            onSelectedChanged: (selected) {
              setState(() {
                _selected[sizeSectionId] = selected;

                final isFamily = selected.contains(
                  popcornSizes[popcornSizeFamilyId],
                );
                selectionLimit = isFamily ? 4 : widget.initialSelectionLimit;
              });
            },
          ),
          if (_selected[sizeSectionId]?.isNotEmpty ?? false)
            PickerEngineSectionWrapper.build(
              id: '$flavorSectionId-$selectedSize',
              title: 'Elige hasta $selectionLimit sabores',
              items: _getPopcornFlavorsWithPrices(
                _selected[sizeSectionId]?.first,
              ),
              withPreview: selectionLimit > 1,
              selectionLimit: selectionLimit,
              onSelectedChanged: (selected) {
                print('selected: $selected');

                setState(() {
                  /// Filter just the most expensive item during selection
                  final mostExpensiveItem = selected.reduce(
                    (a, b) => (a.price ?? 0.0) > (b.price ?? 0.0) ? a : b,
                  );
                  _selected[flavorSectionId] = [mostExpensiveItem];
                });
              },
            ),
        ],
      ),
    );
  }

  List<PickerEngineItem> _getPopcornFlavorsWithPrices(
    PickerEngineItem? sizeSelected,
  ) {
    if (sizeSelected == null) return [];

    final prices = flavorPricesForSize[sizeSelected.id];

    return globalPopcornFlavors
        .map(
          (flavor) => flavor.copyWith(
            price: prices?[flavor.id] ?? 0.0,
          ),
        )
        .toList();
  }
}
