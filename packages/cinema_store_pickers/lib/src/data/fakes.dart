import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
const popcornSizeSmall = 'small';

/// @no-doc
const popcornSizeMedium = 'medium';

/// @no-doc
const popcornSizeLarge = 'large';

/// @no-doc
const popcornSizeJumbo = 'jumbo';

/// @no-doc
const popcornSizeFamily = 'family';

/// @no-doc
final popcornSizes = {
  popcornSizeSmall: const ItemSize(
    id: popcornSizeSmall,
    name: 'Chicas',
    iconName: '',
    price: 80,
  ),
  popcornSizeMedium: const ItemSize(
    id: popcornSizeMedium,
    name: 'Medianas',
    iconName: '',
    price: 85,
  ),
  popcornSizeLarge: const ItemSize(
    id: popcornSizeLarge,
    name: 'Grandes',
    iconName: '',
    price: 90,
  ),
  popcornSizeJumbo: const ItemSize(
    id: popcornSizeJumbo,
    name: 'Jumbo',
    iconName: '',
    price: 95,
  ),
  popcornSizeFamily: const ItemSize(
    id: popcornSizeFamily,
    name: 'Para llevar',
    iconName: '',
    price: 105,
  ),
};

/// @no-doc
const popcornExtraFlavors = {
  'A': ItemFlavor(
    id: 'doritos-nachos',
    name: 'Doritos® Nachos',
    iconName: 'nacho',
    price: MultipleItemPrice(
      prices: {
        popcornSizeSmall: 10,
        popcornSizeMedium: 15,
        popcornSizeLarge: 15,
        popcornSizeFamily: 20,
        popcornSizeJumbo: 20,
      },
    ),
  ),
  'B': ItemFlavor(
    id: 'cheetos-mix',
    name: 'Cheetos MIX',
    iconName: 'stick',
    price: MultipleItemPrice(
      prices: {
        popcornSizeSmall: 15,
        popcornSizeMedium: 20,
        popcornSizeLarge: 20,
        popcornSizeFamily: 25,
        popcornSizeJumbo: 25,
      },
    ),
  ),
  'C': ItemFlavor(
    id: 'takis-blue',
    name: 'Takis® Blue',
    iconName: 'blue_stick',
    price: MultipleItemPrice(
      prices: {
        popcornSizeSmall: 10,
        popcornSizeMedium: 15,
        popcornSizeLarge: 15,
        popcornSizeFamily: 20,
        popcornSizeJumbo: 20,
      },
    ),
  ),
  'D': ItemFlavor(
    id: 'chips-jalapeno',
    name: 'Chips Jalapeño®',
    iconName: 'pepper',
    price: MultipleItemPrice(
      prices: {
        popcornSizeSmall: 10,
        popcornSizeMedium: 15,
        popcornSizeLarge: 15,
        popcornSizeFamily: 20,
        popcornSizeJumbo: 20,
      },
    ),
  ),
  'E': ItemFlavor(
    id: 'ruffles-queso',
    name: 'Ruffles Queso®',
    iconName: 'cheese',
    price: MultipleItemPrice(
      prices: {
        popcornSizeSmall: 10,
        popcornSizeMedium: 15,
        popcornSizeLarge: 15,
        popcornSizeFamily: 20,
        popcornSizeJumbo: 20,
      },
    ),
  ),
};

/// @no-doc
final popcornBaseFlavors = [
  const ItemFlavor(
    id: 'butter',
    name: 'Mantequilla',
    iconName: 'butter',
    price: MultipleItemPrice(
      prices: {
        popcornSizeSmall: 0,
        popcornSizeMedium: 0,
        popcornSizeLarge: 0,
        popcornSizeFamily: 0,
        popcornSizeJumbo: 0,
      },
    ),
  ),
  const ItemFlavor(
    id: 'caramel',
    name: 'Caramelo',
    iconName: 'caramel',
    price: MultipleItemPrice(
      prices: {
        popcornSizeSmall: 10,
        popcornSizeMedium: 15,
        popcornSizeLarge: 15,
        popcornSizeFamily: 20,
        popcornSizeJumbo: 20,
      },
    ),
  ),
];

/// @no-doc
final cinemaBranches = {
  'A': CinemaBranch(
    id: 'A',
    name: 'A',
    selectionLimit: 2,
    brandHexColor: '003366',
    availablePopcornFlavors: [
      ...popcornBaseFlavors,
      popcornExtraFlavors['A']!,
      popcornExtraFlavors['B']!,
      popcornExtraFlavors['C']!,
    ],
    availablePopcornSizes: popcornSizes.values.toList(),
  ),
  'B': CinemaBranch(
    id: 'B',
    name: 'B',
    selectionLimit: 3,
    brandHexColor: 'E30B17',
    availablePopcornFlavors: [
      ...popcornBaseFlavors,
      popcornExtraFlavors['D']!,
      popcornExtraFlavors['E']!,
    ],
    availablePopcornSizes: popcornSizes.values.toList(),
  ),
  'C': CinemaBranch(
    id: 'C',
    name: 'C',
    selectionLimit: 4,
    brandHexColor: 'EF7F1A',
    availablePopcornFlavors: [
      ...popcornBaseFlavors,
      ...popcornExtraFlavors.values,
    ],
    availablePopcornSizes: popcornSizes.values.toList(),
  ),
};
