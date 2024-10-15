import 'package:cinema_store_pickers/src/cinemas/popcorn/fake_popcorn.dart';
import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
final cinemaBranches = {
  'A': CinemaBranch(
    id: 'A',
    name: 'A',
    selectionLimit: 2,
    brandHexColor: '003366',
    availablePopcornFlavors: [],
    availablePopcornSizes: popcornSizes.values.toList(),
  ),
  'B': CinemaBranch(
    id: 'B',
    name: 'B',
    selectionLimit: 3,
    brandHexColor: 'E30B17',
    availablePopcornFlavors: [],
    availablePopcornSizes: popcornSizes.values.toList(),
  ),
  'C': CinemaBranch(
    id: 'C',
    name: 'C',
    selectionLimit: 4,
    brandHexColor: 'EF7F1A',
    availablePopcornFlavors: [],
    availablePopcornSizes: popcornSizes.values.toList(),
  ),
};
