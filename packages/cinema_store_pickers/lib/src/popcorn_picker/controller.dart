import 'package:cinema_store_pickers/src/data/data.dart';
import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornPickerController extends StateNotifier<PopcornPickerState> {
  /// @no-doc
  PopcornPickerController({
    required this.cinemaId,
    required this.popcornOptionsRepository,
  }) : super(const PopcornPickerState());

  /// @no-doc
  final String? cinemaId;

  /// @no-doc
  final PopcornOptionsRepository popcornOptionsRepository;

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
  void toggleSelectedFlavor(ItemFlavor item) {
    final selected = [...state.selectedFlavors];
    final isSelected = selected.contains(item);

    if (isSelected) {
      selected.remove(item);
    } else {
      //if (selected.length == state.selectionLimit) return;
      selected.add(item);
    }

    state = state.copyWith(
      selectedFlavors: selected,
    );
  }

  /// @no-doc
  Future<void> setSelectedCinemaBranch(String cinemaId) async {
    final options = await popcornOptionsRepository.getPopcornFlavors(
      cinemaId,
    );
    state = state.copyWith(
      flavorOptions: options,
      selectedFlavors: [],
    );
  }

  /// @no-doc
  Future<void> _loadData() async {
    if (cinemaId == null) return;
    final popcornFlavorOptions =
        await popcornOptionsRepository.getPopcornFlavors(cinemaId!);
    final popcornSizeOptions =
        await popcornOptionsRepository.getPopcornSizes(cinemaId!);
    final defaultPopcornSize =
        await popcornOptionsRepository.getDefaultPopcornSize(cinemaId!);

    state = state.copyWith(
      selectedSize: defaultPopcornSize,
      sizeOptions: popcornSizeOptions,
      flavorOptions: popcornFlavorOptions,
    );
  }
}
