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
final baseFlavors = [
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
const cinemaBranches = {
  'A': CinemaBranch(
    id: 'A',
    name: 'A',
    selectionLimit: 2,
    brandHexColor: '003366',
  ),
  'B': CinemaBranch(
    id: 'B',
    name: 'B',
    selectionLimit: 3,
    brandHexColor: 'E30B17',
  ),
};

/// @no-doc
const cinemaFlavorsByBranch = {
  'A': [
    PopcornFlavor(
      name: 'Doritos® Nachos',
      iconName: 'nacho',
    ),
    PopcornFlavor(
      name: 'Cheetos Torciditos®',
      iconName: 'stick',
    ),
    PopcornFlavor(
      name: 'Takis® Blue',
      iconName: 'blue_stick',
    ),
  ],
  'B': [
    PopcornFlavor(
      name: 'Chips Jalapeño®',
      iconName: 'pepper',
    ),
    PopcornFlavor(
      name: 'Ruffles Queso®',
      iconName: 'cheese',
    ),
  ],
};
