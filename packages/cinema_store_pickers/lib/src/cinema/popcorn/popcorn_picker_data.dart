import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';

/// @no-doc
const popcornSizeSmallId = PickOMaticItemId('small');

/// @no-doc
const popcornSizeMediumId = PickOMaticItemId('medium');

/// @no-doc
const popcornSizeLargeId = PickOMaticItemId('large');

/// @no-doc
const popcornSizeJumboId = PickOMaticItemId('jumbo');

/// @no-doc
const popcornSizeFamilyId = PickOMaticItemId('family');

/// @no-doc
final popcornSizes = {
  popcornSizeSmallId: const PickOMaticItem(
    id: popcornSizeSmallId,
    name: 'Chicas',
    iconName: '',
    price: 75,
  ),
  popcornSizeMediumId: const PickOMaticItem(
    id: popcornSizeMediumId,
    name: 'Medianas',
    iconName: '',
    price: 80,
  ),
  popcornSizeLargeId: const PickOMaticItem(
    id: popcornSizeLargeId,
    name: 'Grandes',
    iconName: '',
    price: 85,
  ),
  popcornSizeJumboId: const PickOMaticItem(
    id: popcornSizeJumboId,
    name: 'Jumbo',
    iconName: '',
    price: 90,
  ),
  popcornSizeFamilyId: const PickOMaticItem(
    id: popcornSizeFamilyId,
    name: 'Para llevar',
    iconName: '',
    price: 100,
  ),
};

/// @no-doc
const popcornFlavorButterId = PickOMaticItemId('butter');

/// @no-doc
const popcornFlavorCaramelId = PickOMaticItemId('caramel');

/// @no-doc
const popcornFlavorButter = PickOMaticItem(
  id: popcornFlavorButterId,
  name: 'Mantequilla',
  iconName: 'butter',
);

/// @no-doc
const popcornFlavorCaramel = PickOMaticItem(
  id: popcornFlavorCaramelId,
  name: 'Caramelo',
  iconName: 'caramel',
);

/// @no-doc
final globalPopcornBaseFlavors = {
  popcornFlavorButterId: popcornFlavorButter,
  popcornFlavorCaramelId: popcornFlavorCaramel,
};

/// @no-doc
const popcornFlavorDoritosNachosId = PickOMaticItemId('doritos-nachos');

/// @no-doc
const popcornFlavorCheetosMixId = PickOMaticItemId('cheetos-mix');

/// @no-doc
const popcornFlavorTakisBlueId = PickOMaticItemId('takis-blue');

/// @no-doc
const popcornFlavorChipsJalapenoId = PickOMaticItemId('chips-jalapeno');

/// @no-doc
const popcornFlavorRufflesQuesoId = PickOMaticItemId('ruffles-queso');

/// @no-doc
const popcornFlavorDoritosNachos = PickOMaticItem(
  id: popcornFlavorDoritosNachosId,
  name: 'Doritos® Nachos',
  iconName: 'nacho',
);

/// @no-doc
const popcornFlavorCheetosMix = PickOMaticItem(
  id: popcornFlavorCheetosMixId,
  name: 'Cheetos MIX',
  iconName: 'stick',
);

/// @no-doc
const popcornFlavorTakisBlue = PickOMaticItem(
  id: popcornFlavorTakisBlueId,
  name: 'Takis® Blue',
  iconName: 'blue_stick',
);

/// @no-doc
const popcornFlavorChipsJalapeno = PickOMaticItem(
  id: popcornFlavorChipsJalapenoId,
  name: 'Chips Jalapeño®',
  iconName: 'pepper',
);

/// @no-doc
const popcornFlavorRufflesQueso = PickOMaticItem(
  id: popcornFlavorRufflesQuesoId,
  name: 'Ruffles Queso®',
  iconName: 'cheese',
);

/// @no-doc
final globalPopcornExtraFlavors1 = {
  popcornFlavorDoritosNachosId: popcornFlavorDoritosNachos,
  popcornFlavorCheetosMixId: popcornFlavorCheetosMix,
};

/// @no-doc
final globalPopcornExtraFlavors2 = {
  popcornFlavorTakisBlueId: popcornFlavorTakisBlue,
  popcornFlavorRufflesQuesoId: popcornFlavorRufflesQueso,
  popcornFlavorChipsJalapenoId: popcornFlavorChipsJalapeno,
};

/// @no-doc
final globalPopcornFlavors = [
  ...globalPopcornBaseFlavors.values,
  ...globalPopcornExtraFlavors1.values,
];

/// @no-doc
final flavorPricesForSize = <PickOMaticItemId, Map<PickOMaticItemId, double>>{
  popcornSizeSmallId: {
    popcornFlavorCaramelId: 10.0,
    popcornFlavorDoritosNachosId: 10.0,
    popcornFlavorChipsJalapenoId: 10.0,
    popcornFlavorTakisBlueId: 10.0,
    popcornFlavorRufflesQuesoId: 10.0,
    popcornFlavorCheetosMixId: 15.0,
  },
  popcornSizeMediumId: {
    popcornFlavorCaramelId: 15.0,
    popcornFlavorDoritosNachosId: 15.0,
    popcornFlavorChipsJalapenoId: 15.0,
    popcornFlavorTakisBlueId: 15.0,
    popcornFlavorRufflesQuesoId: 15.0,
    popcornFlavorCheetosMixId: 20.0,
  },
  popcornSizeLargeId: {
    popcornFlavorCaramelId: 15.0,
    popcornFlavorDoritosNachosId: 15.0,
    popcornFlavorChipsJalapenoId: 15.0,
    popcornFlavorTakisBlueId: 15.0,
    popcornFlavorRufflesQuesoId: 15.0,
    popcornFlavorCheetosMixId: 20.0,
  },
  popcornSizeJumboId: {
    popcornFlavorCaramelId: 20.0,
    popcornFlavorDoritosNachosId: 20.0,
    popcornFlavorChipsJalapenoId: 20.0,
    popcornFlavorTakisBlueId: 20.0,
    popcornFlavorRufflesQuesoId: 20.0,
    popcornFlavorCheetosMixId: 25.0,
  },
  popcornSizeFamilyId: {
    popcornFlavorCaramelId: 20.0,
    popcornFlavorDoritosNachosId: 20.0,
    popcornFlavorChipsJalapenoId: 20.0,
    popcornFlavorTakisBlueId: 20.0,
    popcornFlavorRufflesQuesoId: 20.0,
    popcornFlavorCheetosMixId: 25.0,
  },
};

/// @no-doc
final globalPopcornFlavorsIds =
    globalPopcornFlavors.map((variant) => variant.id).toList();
