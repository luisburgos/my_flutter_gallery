import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/data/data.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/controller.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
final popcornOptionsRepository = Provider<PopcornOptionsRepository>((ref) {
  return FakePopcornOptionsRepository();
});

/// @no-doc
final popcornPickerNotifierProvider =
    StateNotifierProvider<PopcornPickerController, PopcornPickerState>(
  (ref) {
    final popcornOptions = ref.watch(popcornOptionsRepository);
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);
    return PopcornPickerController(
      cinemaId: cinemaStore.selectedCinema?.id,
      popcornOptionsRepository: popcornOptions,
    );
  },
);
