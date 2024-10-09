import 'package:cinema_store_pickers/src/data/data.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/controller.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
final popcornOptionsRepository = Provider<PopcornOptionsRepository>((ref) {
  return FakePopcornOptionsRepository();
});

/// @no-doc
final cinemaBranchesRepository = Provider<CinemaBranchesRepository>((ref) {
  return FakeCinemaBranchesRepository();
});

/// @no-doc
final popcornPickerNotifierProvider =
    StateNotifierProvider<PopcornPickerController, PopcornPickerState>(
  (ref) {
    final popcornOptions = ref.watch(popcornOptionsRepository);
    final cinemaBranches = ref.watch(cinemaBranchesRepository);
    return PopcornPickerController(
      popcornOptionsRepository: popcornOptions,
      cinemaBranchesRepository: cinemaBranches,
    );
  },
);
