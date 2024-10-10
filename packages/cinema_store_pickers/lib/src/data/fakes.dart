import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
final popcornSizes = {
  'small': const PopcornSize(name: 'Chicas', iconName: ''),
  'medium': const PopcornSize(name: 'Medianas', iconName: ''),
  'large': const PopcornSize(name: 'Grandes', iconName: ''),
  'jumbo': const PopcornSize(name: 'Jumbo', iconName: ''),
  'family': const PopcornSize(name: 'Para llevar', iconName: ''),
};

/// @no-doc
const popcornExtraFlavors = {
  'A': PopcornFlavor(
    name: 'Doritos® Nachos',
    iconName: 'nacho',
  ),
  'B': PopcornFlavor(
    name: 'Cheetos Torciditos®',
    iconName: 'stick',
  ),
  'C': PopcornFlavor(
    name: 'Takis® Blue',
    iconName: 'blue_stick',
  ),
  'D': PopcornFlavor(
    name: 'Chips Jalapeño®',
    iconName: 'pepper',
  ),
  'E': PopcornFlavor(
    name: 'Ruffles Queso®',
    iconName: 'cheese',
  ),
};

/// @no-doc
final popcornBaseFlavors = [
  const PopcornFlavor(
    name: 'Mantequilla',
    iconName: 'butter',
  ),
  const PopcornFlavor(
    name: 'Caramelo',
    iconName: 'caramel',
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
  ),
};
