import 'package:cinema_store_pickers/src/popcorn_picker/models.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/services.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornPickerController extends StateNotifier<PopcornPickerState> {
  /// @no-doc
  PopcornPickerController({
    required this.optionsService,
  }) : super(const PopcornPickerState());

  /// @no-doc
  final PopcornFlavorPickerOptionsService optionsService;

  /// Call this method after the controller is created
  Future<void> initialize() async {
    await loadOptions();
  }

  /// @no-doc
  void toggleSelected(PopcornFlavor item) {
    final selected = [...state.selected];
    final isSelected = selected.contains(item);

    if (isSelected) {
      selected.remove(item);
    } else {
      if (selected.length == state.selectionLimit) return;
      selected.add(item);
    }

    state = state.copyWith(
      selected: selected,
    );
  }

  /// @no-doc
  Future<void> setSelectedCinema(String cinema) async {
    final config = await optionsService.getConfigForCinemaId(cinema);
    final options = await optionsService.getPopcornFlavorOptions(cinema);
    state = state.copyWith(
      options: options,
      selectionLimit: config.selectionLimit,
      selectedCinema: cinema,
      selected: [],
      brandHexColor: config.brandHexColor,
    );
  }

  /// @no-doc
  Future<void> loadOptions() async {
    final defaultCinema = await optionsService.getDefaultCinemaId();
    final cinemaOptions = await optionsService.getDefaultCinemas();
    final config = await optionsService.getConfigForCinemaId(defaultCinema);
    final options = await optionsService.getPopcornFlavorOptions(defaultCinema);
    state = state.copyWith(
      options: options,
      selectionLimit: config.selectionLimit,
      cinemaOptions: cinemaOptions,
      selectedCinema:
          cinemaOptions.firstWhere((cinema) => cinema == defaultCinema),
      brandHexColor: config.brandHexColor,
    );
  }
}
