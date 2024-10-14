import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
class PopcornPickerState {
  /// @no-doc
  const PopcornPickerState({
    this.selectedSize,
    this.selectedFlavors = const [],
    this.flavorOptions = const [],
    this.sizeOptions = const [],
  });

  /// @no-doc
  final List<ItemFlavor> selectedFlavors;

  /// @no-doc
  final List<ItemFlavor> flavorOptions;

  /// @no-doc
  final ItemSize? selectedSize;

  /// @no-doc
  final List<ItemSize> sizeOptions;

  /// @no-doc
  PopcornPickerState copyWith({
    ItemSize? selectedSize,
    List<ItemSize>? sizeOptions,
    List<ItemFlavor>? selectedFlavors,
    List<ItemFlavor>? flavorOptions,
  }) {
    return PopcornPickerState(
      selectedSize: selectedSize ?? this.selectedSize,
      selectedFlavors: selectedFlavors ?? this.selectedFlavors,
      flavorOptions: flavorOptions ?? this.flavorOptions,
      sizeOptions: sizeOptions ?? this.sizeOptions,
    );
  }
}
