import 'package:cinema_store_pickers/src/models/item_flavor.dart';
import 'package:cinema_store_pickers/src/models/item_ice.dart';
import 'package:cinema_store_pickers/src/models/item_size.dart';
import 'package:cinema_store_pickers/src/models/store_item.dart';

/// @no-doc
const waterBottle1 = StoreItem(
  id: 'water-bottle-01',
  name: 'Agua Embotellada',
);

/// @no-doc
const waterSize1 = ItemSize(
  id: 'water-size-01',
  name: '600 ML',
  price: 36,
  iconName: 'bottle',
);

/// @no-doc
const sodaBottle1 = StoreItem(
  id: 'soda-bottle-01',
  name: 'Refresco',
);

/// @no-doc
const sodaSize1 = ItemSize(
  id: 'soda-size-01',
  name: 'Chico 473ml',
  price: 76,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize2 = ItemSize(
  id: 'soda-size-02',
  name: 'Mediano 591ml',
  price: 81,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize3 = ItemSize(
  id: 'soda-size-03',
  name: 'Grande 946ml',
  price: 84,
  iconName: 'bottle',
);

/// @no-doc
const sodaSize4 = ItemSize(
  id: 'soda-size-04',
  name: 'Jumbo 1.2L',
  price: 88,
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor1 = ItemFlavor(
  id: 'soda-flavor-01',
  name: 'Coca-Cola® Sin Azúcar',
  price: SingleItemPrice(price: 0),
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor2 = ItemFlavor(
  id: 'soda-flavor-02',
  name: 'Coca-Cola®',
  price: SingleItemPrice(price: 0),
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor3 = ItemFlavor(
  id: 'soda-flavor-03',
  name: 'Coca-Cola® Light',
  price: SingleItemPrice(price: 0),
  iconName: 'bottle',
);

/// @no-doc
const sodaFlavor4 = ItemFlavor(
  id: 'soda-flavor-04',
  name: 'Del Valle Frut',
  price: SingleItemPrice(price: 0),
  iconName: 'bottle',
);

/// @no-doc
const itemIce1 = ItemIce(
  id: 'ice-option-01',
  name: 'Hielo Regular',
);

/// @no-doc
const itemIce2 = ItemIce(
  id: 'ice-option-02',
  name: 'Poco Hielo',
);

/// @no-doc
const itemIce3 = ItemIce(
  id: 'ice-option-03',
  name: 'Sin Hielo',
);
