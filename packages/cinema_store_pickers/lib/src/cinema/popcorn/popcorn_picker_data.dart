import 'package:cinema_store_pickers/src/engine/picker_engine.dart';

/// @no-doc
const popcornSizeSmallId = PickerEngineItemId('small');

/// @no-doc
const popcornSizeMediumId = PickerEngineItemId('medium');

/// @no-doc
const popcornSizeLargeId = PickerEngineItemId('large');

/// @no-doc
const popcornSizeJumboId = PickerEngineItemId('jumbo');

/// @no-doc
const popcornSizeFamilyId = PickerEngineItemId('family');

/// @no-doc
final popcornSizes = {
  popcornSizeSmallId: const PickerEngineItem(
    id: popcornSizeSmallId,
    name: 'Chicas',
    iconName: '',
    price: 75,
  ),
  popcornSizeMediumId: const PickerEngineItem(
    id: popcornSizeMediumId,
    name: 'Medianas',
    iconName: '',
    price: 80,
  ),
  popcornSizeLargeId: const PickerEngineItem(
    id: popcornSizeLargeId,
    name: 'Grandes',
    iconName: '',
    price: 85,
  ),
  popcornSizeJumboId: const PickerEngineItem(
    id: popcornSizeJumboId,
    name: 'Jumbo',
    iconName: '',
    price: 90,
  ),
  popcornSizeFamilyId: const PickerEngineItem(
    id: popcornSizeFamilyId,
    name: 'Para llevar',
    iconName: '',
    price: 100,
  ),
};

/// @no-doc
const popcornFlavorButterId = PickerEngineItemId('butter');

/// @no-doc
const popcornFlavorCaramelId = PickerEngineItemId('caramel');

/// @no-doc
const popcornFlavorButter = PickerEngineItem(
  id: popcornFlavorButterId,
  name: 'Mantequilla',
  iconName: 'butter',
);

/// @no-doc
const popcornFlavorCaramel = PickerEngineItem(
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
const popcornFlavorDoritosNachosId = PickerEngineItemId('doritos-nachos');

/// @no-doc
const popcornFlavorCheetosMixId = PickerEngineItemId('cheetos-mix');

/// @no-doc
const popcornFlavorTakisBlueId = PickerEngineItemId('takis-blue');

/// @no-doc
const popcornFlavorChipsJalapenoId = PickerEngineItemId('chips-jalapeno');

/// @no-doc
const popcornFlavorRufflesQuesoId = PickerEngineItemId('ruffles-queso');

/// @no-doc
const popcornFlavorDoritosNachos = PickerEngineItem(
  id: popcornFlavorDoritosNachosId,
  name: 'Doritos® Nachos',
  iconName: 'nacho',
);

/// @no-doc
const popcornFlavorCheetosMix = PickerEngineItem(
  id: popcornFlavorCheetosMixId,
  name: 'Cheetos MIX',
  iconName: 'stick',
);

/// @no-doc
const popcornFlavorTakisBlue = PickerEngineItem(
  id: popcornFlavorTakisBlueId,
  name: 'Takis® Blue',
  iconName: 'blue_stick',
);

/// @no-doc
const popcornFlavorChipsJalapeno = PickerEngineItem(
  id: popcornFlavorChipsJalapenoId,
  name: 'Chips Jalapeño®',
  iconName: 'pepper',
);

/// @no-doc
const popcornFlavorRufflesQueso = PickerEngineItem(
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
final flavorPricesForSize =
    <PickerEngineItemId, Map<PickerEngineItemId, double>>{
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
