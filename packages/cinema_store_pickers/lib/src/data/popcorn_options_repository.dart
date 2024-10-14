import 'package:cinema_store_pickers/src/data/fakes.dart';
import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
abstract class PopcornOptionsRepository {
  /// @no-doc
  Future<List<ItemFlavor>> getPopcornFlavors(String cinemaId);

  /// @no-doc
  Future<List<ItemSize>> getPopcornSizes(String cinemaId);

  /// @no-doc
  Future<ItemSize> getDefaultPopcornSize(String cinemaId);
}

/// @no-doc
class FakePopcornOptionsRepository extends PopcornOptionsRepository {
  @override
  Future<List<ItemFlavor>> getPopcornFlavors(String cinemaId) async {
    final cinemaFlavors = cinemaBranches[cinemaId]?.availablePopcornFlavors;
    return [
      ...popcornBaseFlavors,
      ...cinemaFlavors ?? [],
    ];
  }

  @override
  Future<List<ItemSize>> getPopcornSizes(String cinemaId) async {
    return popcornSizes.values.toList();
  }

  @override
  Future<ItemSize> getDefaultPopcornSize(String cinemaId) async {
    return popcornSizes.values.first;
  }
}
