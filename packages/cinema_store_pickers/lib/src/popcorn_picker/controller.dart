import 'package:cinema_store_pickers/src/data/data.dart';
import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornPickerController extends StateNotifier<PopcornPickerState> {
  /// @no-doc
  PopcornPickerController({
    required this.popcornOptionsRepository,
    required this.cinemaBranchesRepository,
  }) : super(const PopcornPickerState());

  /// @no-doc

  final PopcornOptionsRepository popcornOptionsRepository;

  /// @no-doc
  final CinemaBranchesRepository cinemaBranchesRepository;

  /// Call this method after the controller is created
  Future<void> initialize() async {
    await _loadData();
  }

  /// @no-doc
  void toggleSelectedSize(ItemSize item) {
    final selected = state.selectedSize;
    if (selected != item) {
      state = state.copyWith(
        selectedSize: item,
      );
    }
  }

  /// @no-doc
  void toggleSelectedFlavor(PopcornFlavor item) {
    final selected = [...state.selectedFlavors];
    final isSelected = selected.contains(item);

    if (isSelected) {
      selected.remove(item);
    } else {
      if (selected.length == state.selectionLimit) return;
      selected.add(item);
    }

    state = state.copyWith(
      selectedFlavors: selected,
    );
  }

  /// @no-doc
  Future<void> setSelectedCinemaBranch(String cinemaId) async {
    final cinemaBranch =
        await cinemaBranchesRepository.getCinemaBranchById(cinemaId);
    final options = await popcornOptionsRepository.getPopcornFlavors(cinemaId);
    state = state.copyWith(
      flavorOptions: options,
      selectionLimit: cinemaBranch.selectionLimit,
      selectedCinema: cinemaBranch,
      selectedFlavors: [],
      brandHexColor: cinemaBranch.brandHexColor,
    );
  }

  /// @no-doc
  Future<void> _loadData() async {
    final defaultCinemaBranch =
        await cinemaBranchesRepository.getDefaultCinemaBranch();
    final cinemaBranches =
        await cinemaBranchesRepository.getDefaultCinemaBranches();
    final popcornFlavorOptions =
        await popcornOptionsRepository.getPopcornFlavors(
      defaultCinemaBranch.id,
    );
    final popcornSizeOptions = await popcornOptionsRepository.getPopcornSizes(
      defaultCinemaBranch.id,
    );
    final defaultPopcornSize =
        await popcornOptionsRepository.getDefaultPopcornSize(
      defaultCinemaBranch.id,
    );

    state = state.copyWith(
      flavorOptions: popcornFlavorOptions,
      selectionLimit: defaultCinemaBranch.selectionLimit,
      cinemaOptions: cinemaBranches,
      selectedCinema: cinemaBranches.firstWhere(
        (cinema) => cinema == defaultCinemaBranch,
      ),
      selectedSize: defaultPopcornSize,
      sizeOptions: popcornSizeOptions,
      brandHexColor: defaultCinemaBranch.brandHexColor,
    );
  }
}
