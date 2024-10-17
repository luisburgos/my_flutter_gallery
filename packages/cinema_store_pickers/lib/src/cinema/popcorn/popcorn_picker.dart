import 'package:cinema_store_pickers/src/cinema/popcorn/fake_popcorn.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PopcornPickerWidget extends StatefulWidget {
  /// @no-doc
  const PopcornPickerWidget({
    super.key,
    this.initialSelectionLimit = 2,
  });

  /// @no-doc
  final int initialSelectionLimit;

  @override
  State<PopcornPickerWidget> createState() => _PopcornPickerWidgetState();
}

class _PopcornPickerWidgetState extends State<PopcornPickerWidget> {
  late int selectionLimit;

  @override
  void initState() {
    selectionLimit = widget.initialSelectionLimit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const id = 'popcorn-01';

    return PickOMaticWidget(
      key: const Key(id),
      sections: [
        PickOMaticSectionWrapper.build(
          id: '$id-size',
          title: 'Elige un tamaño',
          items: popcornSizes.values.toList(),
          onSelectedChanged: (selected) {
            setState(() {
              final isFamily = selected.contains(
                const PickOMaticItem(
                  id: PickOMaticItemId('family'),
                  name: 'Para llevar',
                  iconName: '',
                  price: 0,
                ),
              );
              selectionLimit = isFamily ? 4 : widget.initialSelectionLimit;
            });
          },
        ),
        PickOMaticSectionWrapper.build(
          id: '$id-flavor',
          title: 'Elige hasta $selectionLimit sabores',
          items: globalPopcornFlavors,
          withPreview: selectionLimit > 1,
          selectionLimit: selectionLimit,
        ),
      ],
    );
  }
}
