import 'package:cinema_store_pickers/src/data/fakes.dart';
import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
abstract class CinemaBranchesRepository {
  /// @no-doc
  Future<CinemaBranch> getDefaultCinemaBranch();

  /// @no-doc
  Future<CinemaBranch> getCinemaBranchById(String cinemaId);

  /// @no-doc
  Future<List<CinemaBranch>> getDefaultCinemaBranches();
}

/// @no-doc
class FakeCinemaBranchesRepository extends CinemaBranchesRepository {
  @override
  Future<CinemaBranch> getCinemaBranchById(String cinemaId) async {
    return cinemaBranches[cinemaId]!;
  }

  @override
  Future<CinemaBranch> getDefaultCinemaBranch() async {
    return cinemaBranches.values.first;
  }

  @override
  Future<List<CinemaBranch>> getDefaultCinemaBranches() async {
    return cinemaBranches.values.toList();
  }
}
