import 'package:cinema_store_pickers/src/cinemas/popcorn/fake_popcorn.dart';
import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
final popcornStoreItem = StoreItem(
  id: 'popcorn-01',
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
