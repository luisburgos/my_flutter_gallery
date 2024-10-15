import 'package:cinema_store_pickers/src/cinemas/beverages/fakes_beverages.dart';
import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
final waterBottle1 = StoreItem(
  id: 'water-bottle-01',
  name: 'Agua Embotellada',
  possibleSizes: waterBottleSizes.values.toList(),
  possibleVariants: [],
  availableVariantsBySize: {},
  variantPriceBySize: {},
);

/// @no-doc
final sodaStoreItem = StoreItem(
  id: 'soda-01',
  name: 'Refresco',
  possibleSizes: sodaSizes.values.toList(),
  possibleVariants: [
    sodaFlavor1,
    sodaFlavor2,
    sodaFlavor3,
    sodaFlavor4,
  ],
  availableVariantsBySize: {},
  variantPriceBySize: {},
);
