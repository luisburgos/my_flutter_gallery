import 'package:cinema_store_pickers/src/cinemas/controller.dart';
import 'package:cinema_store_pickers/src/cinemas/state.dart';
import 'package:cinema_store_pickers/src/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
final cinemaBranchesRepository = Provider<CinemaBranchesRepository>((ref) {
  return FakeCinemaBranchesRepository();
});

/// @no-doc
final cinemaStoreNotifierProvider =
    StateNotifierProvider<CinemaStoreController, CinemaStoreState>(
  (ref) {
    final cinemaBranches = ref.watch(cinemaBranchesRepository);
    return CinemaStoreController(
      cinemaStoreRepository: cinemaBranches,
    );
  },
);
