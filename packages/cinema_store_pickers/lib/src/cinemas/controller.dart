import 'package:cinema_store_pickers/src/cinemas/state.dart';
import 'package:cinema_store_pickers/src/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    state = state.copyWith(
      cinemaOptions: cinemaBranches,
      selectedCinema: cinemaBranches.firstWhere(
        (cinema) => cinema == defaultCinemaBranch,
      ),
      brandHexColor: defaultCinemaBranch.brandHexColor,
    );
  }
}
