import 'package:cinema_store_pickers/src/popcorn_picker/models.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/services.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornPickerController extends StateNotifier<PopcornPickerState> {
  /// @no-doc
  PopcornPickerController({
    required this.service,
  }) : super(const PopcornPickerState());

  /// @no-doc
  final PopcornPickerService service;

  /// Call this method after the controller is created
  Future<void> initialize() async {
    await _loadData();
  }

  /// @no-doc
  void toggleSelected(PopcornFlavorOption item) {
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
  Future<void> setSelectedCinemaBranch(String cinemaId) async {
    final cinemaBranch = await service.getCinemaBranchById(cinemaId);
    final options = await service.getPopcornFlavorOptions(cinemaId);
    state = state.copyWith(
      options: options,
      selectionLimit: cinemaBranch.selectionLimit,
      selectedCinema: cinemaBranch,
      selected: [],
      brandHexColor: cinemaBranch.brandHexColor,
    );
  }

  /// @no-doc
  Future<void> _loadData() async {
    final defaultCinemaBranch = await service.getDefaultCinemaBranch();
    final cinemaBranches = await service.getDefaultCinemaBranches();
    final popcornFlavorOptions = await service.getPopcornFlavorOptions(
      defaultCinemaBranch.id,
    );
    state = state.copyWith(
      options: popcornFlavorOptions,
      selectionLimit: defaultCinemaBranch.selectionLimit,
      cinemaOptions: cinemaBranches,
      selectedCinema: cinemaBranches.firstWhere(
        (cinema) => cinema == defaultCinemaBranch,
      ),
      brandHexColor: defaultCinemaBranch.brandHexColor,
    );
  }
}
