import 'package:cinema_store_pickers/src/cinemas/popcorn/fake_popcorn.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PopcornPickerWidget extends StatefulWidget {
  /// @no-doc
  const PopcornPickerWidget({super.key});

  @override
  State<PopcornPickerWidget> createState() => _PopcornPickerWidgetState();
}

class _PopcornPickerWidgetState extends State<PopcornPickerWidget> {
  int selectionLimit = 1;

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
                  selectionLimit = 1;
              }
            });
          },
        ),
        PickOMaticSectionWrapper.build(
          id: '$id-flavor',
          title: 'Elige un sabor',
          items: globalPopcornFlavors,
          withPreview: selectionLimit > 1,
          selectionLimit: selectionLimit,
        ),
      ],
    );
  }
}

/*
final popcornStoreItem = StoreItem(
  name: 'Palomitas',
  possibleSizes: popcornSizes.values.toList(),
  possibleVariants: globalPopcornFlavors,
  availableVariantsBySize: {
    popcornSizeSmallId: globalPopcornFlavorsIds,
    popcornSizeMediumId: globalPopcornFlavorsIds,
    popcornSizeLargeId: globalPopcornFlavorsIds,
    popcornSizeJumboId: globalPopcornFlavorsIds,
    popcornSizeFamilyId: globalPopcornFlavorsIds,
  },
  variantPriceBySize: {
    popcornSizeSmallId: {
      popcornFlavorButterId: 0,
      popcornFlavorCaramelId: 0,
      popcornFlavorDoritosNachosId: 0,
      popcornFlavorCheetosMixId: 0,
      popcornFlavorTakisBlueId: 0,
      popcornFlavorRufflesQuesoId: 0,
      popcornFlavorChipsJalapenoId: 0,
    },
    popcornSizeMediumId: {
      popcornFlavorButterId: 0,
      popcornFlavorCaramelId: 0,
      popcornFlavorDoritosNachosId: 0,
      popcornFlavorCheetosMixId: 0,
      popcornFlavorTakisBlueId: 0,
      popcornFlavorRufflesQuesoId: 0,
      popcornFlavorChipsJalapenoId: 0,
    },
    popcornSizeLargeId: {
      popcornFlavorButterId: 0,
      popcornFlavorCaramelId: 0,
      popcornFlavorDoritosNachosId: 0,
      popcornFlavorCheetosMixId: 0,
      popcornFlavorTakisBlueId: 0,
      popcornFlavorRufflesQuesoId: 0,
      popcornFlavorChipsJalapenoId: 0,
    },
    popcornSizeJumboId: {
      popcornFlavorButterId: 0,
      popcornFlavorCaramelId: 0,
      popcornFlavorDoritosNachosId: 0,
      popcornFlavorCheetosMixId: 0,
      popcornFlavorTakisBlueId: 0,
      popcornFlavorRufflesQuesoId: 0,
      popcornFlavorChipsJalapenoId: 0,
    },
    popcornSizeFamilyId: {
      popcornFlavorButterId: 0,
      popcornFlavorCaramelId: 0,
      popcornFlavorDoritosNachosId: 0,
      popcornFlavorCheetosMixId: 0,
      popcornFlavorTakisBlueId: 0,
      popcornFlavorRufflesQuesoId: 0,
      popcornFlavorChipsJalapenoId: 0,
    },
  },
);
*/
