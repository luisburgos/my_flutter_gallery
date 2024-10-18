import 'package:cinema_store_pickers/src/pickomatic/pickomatic_item.dart';

/// @no-doc
const waterBottleSize01 = PickOMaticItemId('water-size-01');

/// @no-doc
const waterBottleSize02 = PickOMaticItemId('water-size-02');

/// @no-doc
const sodaSizeSmallId = PickOMaticItemId('small');

/// @no-doc
const sodaSizeMediumId = PickOMaticItemId('medium');

/// @no-doc
const sodaSizeLargeId = PickOMaticItemId('large');

/// @no-doc
const sodaSizeJumboId = PickOMaticItemId('jumbo');

/// @no-doc
const waterSize1 = PickOMaticItem(
  id: waterBottleSize01,
  name: '600 ML',
  price: 36,
  iconName: 'bottle',
);

/// @no-doc
const waterSize2 = PickOMaticItem(
  id: waterBottleSize01,
  name: '1 L',
  price: 48,
  iconName: 'bottle',
);

/// @no-doc
final waterBottleSizes = {
  waterBottleSize01: waterSize1,
  waterBottleSize02: waterSize2,
};

/// @no-doc
const sodaSize1 = PickOMaticItem(
  id: sodaSizeSmallId,
  name: 'Chico 473ml',
  price: 76,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize2 = PickOMaticItem(
  id: sodaSizeMediumId,
  name: 'Mediano 591ml',
  price: 81,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize3 = PickOMaticItem(
  id: sodaSizeLargeId,
  name: 'Grande 946ml',
  price: 84,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize4 = PickOMaticItem(
  id: sodaSizeJumboId,
  name: 'Jumbo 1.2L',
  price: 88,
  iconName: 'bottle',
);

/// @no-doc
final sodaSizes = {
  sodaSizeSmallId: sodaSize1,
  sodaSizeMediumId: sodaSize2,
  sodaSizeLargeId: sodaSize3,
  sodaSizeJumboId: sodaSize4,
};

/// @no-doc
final sodaFlavors = {
  sodaSizeSmallId: sodaFlavor1,
  sodaSizeMediumId: sodaSize2,
  sodaSizeLargeId: sodaSize3,
  sodaSizeJumboId: sodaSize4,
};

/// @no-doc
const sodaFlavor1 = PickOMaticItem(
  id: PickOMaticItemId('soda-flavor-01'),
  name: 'Coca-Cola® Sin Azúcar',
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor2 = PickOMaticItem(
  id: PickOMaticItemId('soda-flavor-02'),
  name: 'Coca-Cola®',
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor3 = PickOMaticItem(
  id: PickOMaticItemId('soda-flavor-03'),
  name: 'Coca-Cola® Light',
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor4 = PickOMaticItem(
  id: PickOMaticItemId('soda-flavor-04'),
  name: 'Del Valle Frut',
  iconName: 'bottle',
);

/// @no-doc
const itemIce1 = PickOMaticItem(
  id: PickOMaticItemId('ice-option-01'),
  name: 'Hielo Regular',
  iconName: '',
);

/// @no-doc
const itemIce2 = PickOMaticItem(
  id: PickOMaticItemId('ice-option-02'),
  name: 'Poco Hielo',
  iconName: '',
);

/// @no-doc
const itemIce3 = PickOMaticItem(
  id: PickOMaticItemId('ice-option-03'),
  name: 'Sin Hielo',
  iconName: '',
);
