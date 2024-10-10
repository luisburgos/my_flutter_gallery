import 'package:cinema_store_pickers/src/data/fakes.dart';
import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
abstract class PopcornOptionsRepository {
  /// @no-doc
  Future<List<PopcornFlavor>> getPopcornFlavors(String cinemaId);

  /// @no-doc
  Future<List<PopcornSize>> getPopcornSizes(String cinemaId);

  /// @no-doc
  Future<PopcornSize> getDefaultPopcornSize(String cinemaId);
}

/// @no-doc
class FakePopcornOptionsRepository extends PopcornOptionsRepository {
  @override
  Future<List<PopcornFlavor>> getPopcornFlavors(String cinemaId) async {
    final cinemaFlavors = cinemaBranches[cinemaId]?.availablePopcornFlavors;
    return [
      ...popcornBaseFlavors,
      ...cinemaFlavors ?? [],
    ];
  }

  @override
  Future<List<PopcornSize>> getPopcornSizes(String cinemaId) async {
    return popcornSizes.values.toList();
  }

  @override
  Future<PopcornSize> getDefaultPopcornSize(String cinemaId) async {
    return popcornSizes.values.first;
  }
}
