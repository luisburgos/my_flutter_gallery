import 'package:cinema_store_pickers/src/popcorn_picker/controller.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/services.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
final popcornFlavorPickerOptionsServiceProvider =
    Provider<PopcornFlavorPickerOptionsService>((ref) {
  return DefaultPopcornFlavorPickerOptionsService();
});

/// @no-doc
final popcornFlavorPickerNotifierProvider =
    StateNotifierProvider<PopcornPickerController, PopcornPickerState>((ref) {
  final optionsService = ref.watch(popcornFlavorPickerOptionsServiceProvider);
  return PopcornPickerController(optionsService: optionsService);
});
