import 'package:cinema_store_pickers/src/cinemas/popcorn/fake_popcorn.dart';
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
          onSelected: (option) {
            setState(() {
              switch (option.name) {
                case 'Para llevar':
                  selectionLimit = 4;
                default:
                  selectionLimit = widget.initialSelectionLimit;
              }
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
