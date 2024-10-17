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
    price: 80,
  ),
  popcornSizeMediumId: const PickOMaticItem(
    id: popcornSizeMediumId,
    name: 'Medianas',
    iconName: '',
    price: 85,
  ),
  popcornSizeLargeId: const PickOMaticItem(
    id: popcornSizeLargeId,
    name: 'Grandes',
    iconName: '',
    price: 90,
  ),
  popcornSizeJumboId: const PickOMaticItem(
    id: popcornSizeJumboId,
    name: 'Jumbo',
    iconName: '',
    price: 95,
  ),
  popcornSizeFamilyId: const PickOMaticItem(
    id: popcornSizeFamilyId,
    name: 'Para llevar',
    iconName: '',
    price: 105,
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
final globalPopcornFlavorsIds =
    globalPopcornFlavors.map((variant) => variant.id).toList();
