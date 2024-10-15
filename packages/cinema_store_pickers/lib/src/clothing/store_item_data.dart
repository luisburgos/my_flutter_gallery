import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';

/// @no-doc
final tShirtStoreItem = StoreItem(
  id: 't-shirts-01',
  name: 'Playera Oversized Fit',
  possibleSizes: [
    PickOMaticItem(
      id: PickOMaticItemId('blue'),
      name: 'BLUE',
      price: 0,
      iconName: '',
    ),
    PickOMaticItem(
      id: PickOMaticItemId('white'),
      name: 'WHITE',
      price: 0,
      iconName: '',
    ),
  ],
  possibleVariants: [
    PickOMaticItem(
      id: PickOMaticItemId('s'),
      name: 'S',
      iconName: '',
    ),
    PickOMaticItem(
      id: PickOMaticItemId('m'),
      name: 'M',
      iconName: '',
    ),
    PickOMaticItem(
      id: PickOMaticItemId('g'),
      name: 'G',
      iconName: '',
    ),
  ],
  availableVariantsBySize: {
    PickOMaticItemId('blue'): [
      PickOMaticItemId('s'),
      PickOMaticItemId('m'),
    ],
    PickOMaticItemId('white'): [
      PickOMaticItemId('s'),
      PickOMaticItemId('l'),
    ],
  },
  variantPriceBySize: {},
);
