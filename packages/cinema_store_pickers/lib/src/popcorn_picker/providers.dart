import 'package:cinema_store_pickers/src/popcorn_picker/controller.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/services.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
final popcornPickerServiceProvider = Provider<PopcornPickerService>((ref) {
  return DefaultPopcornPickerService();
});

/// @no-doc
final popcornPickerNotifierProvider =
    StateNotifierProvider<PopcornPickerController, PopcornPickerState>(
  (ref) {
    final service = ref.watch(popcornPickerServiceProvider);
    return PopcornPickerController(service: service);
  },
);
