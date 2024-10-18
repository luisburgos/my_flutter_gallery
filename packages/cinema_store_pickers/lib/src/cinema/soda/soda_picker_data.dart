import 'package:cinema_store_pickers/src/engine/sections/section/models/picker_engine_item.dart';

/// @no-doc
const waterBottleSize01 = PickerEngineItemId('water-size-01');

/// @no-doc
const waterBottleSize02 = PickerEngineItemId('water-size-02');

/// @no-doc
const sodaSizeSmallId = PickerEngineItemId('small');

/// @no-doc
const sodaSizeMediumId = PickerEngineItemId('medium');

/// @no-doc
const sodaSizeLargeId = PickerEngineItemId('large');

/// @no-doc
const sodaSizeJumboId = PickerEngineItemId('jumbo');

/// @no-doc
const waterSize1 = PickerEngineItem(
  id: waterBottleSize01,
  name: '600 ML',
  price: 36,
  iconName: 'bottle',
);

/// @no-doc
const waterSize2 = PickerEngineItem(
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
const sodaSize1 = PickerEngineItem(
  id: sodaSizeSmallId,
  name: 'Chico 473ml',
  price: 76,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize2 = PickerEngineItem(
  id: sodaSizeMediumId,
  name: 'Mediano 591ml',
  price: 81,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize3 = PickerEngineItem(
  id: sodaSizeLargeId,
  name: 'Grande 946ml',
  price: 84,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize4 = PickerEngineItem(
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
const sodaFlavor1 = PickerEngineItem(
  id: PickerEngineItemId('soda-flavor-01'),
  name: 'Coca-Cola® Sin Azúcar',
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor2 = PickerEngineItem(
  id: PickerEngineItemId('soda-flavor-02'),
  name: 'Coca-Cola®',
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor3 = PickerEngineItem(
  id: PickerEngineItemId('soda-flavor-03'),
  name: 'Coca-Cola® Light',
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor4 = PickerEngineItem(
  id: PickerEngineItemId('soda-flavor-04'),
  name: 'Del Valle Frut',
  iconName: 'bottle',
);

/// @no-doc
const itemIce1 = PickerEngineItem(
  id: PickerEngineItemId('ice-option-01'),
  name: 'Hielo Regular',
  iconName: '',
);

/// @no-doc
const itemIce2 = PickerEngineItem(
  id: PickerEngineItemId('ice-option-02'),
  name: 'Poco Hielo',
  iconName: '',
);

/// @no-doc
const itemIce3 = PickerEngineItem(
  id: PickerEngineItemId('ice-option-03'),
  name: 'Sin Hielo',
  iconName: '',
);
