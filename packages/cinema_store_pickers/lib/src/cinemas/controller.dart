import 'package:cinema_store_pickers/src/cinemas/state.dart';
import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_cinema_branch.dart';

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

/// @no-doc
class CinemaStoreController extends StateNotifier<CinemaStoreState> {
  /// @no-doc
  CinemaStoreController({
    required this.cinemaStoreRepository,
  }) : super(const CinemaStoreState());

  /// @no-doc
  final CinemaBranchesRepository cinemaStoreRepository;

  /// Call this method after the controller is created
  Future<void> initialize() async {
    await _loadData();
  }

  /// @no-doc
  Future<void> setSelectedCinemaBranch(String cinemaId) async {
    final cinemaBranch = await cinemaStoreRepository.getCinemaBranchById(
      cinemaId,
    );
    state = state.copyWith(
      selectedCinema: cinemaBranch,
      brandHexColor: cinemaBranch.brandHexColor,
    );
  }

  /// @no-doc
  Future<void> _loadData() async {
    final defaultCinemaBranch =
        await cinemaStoreRepository.getDefaultCinemaBranch();
    final cinemaBranches =
        await cinemaStoreRepository.getDefaultCinemaBranches();

    if (!mounted) return;
    state = state.copyWith(
      cinemaOptions: cinemaBranches,
      selectedCinema: cinemaBranches.firstWhere(
        (cinema) => cinema == defaultCinemaBranch,
      ),
      brandHexColor: defaultCinemaBranch.brandHexColor,
    );
  }
}
