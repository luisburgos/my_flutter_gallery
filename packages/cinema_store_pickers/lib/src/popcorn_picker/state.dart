import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
class PopcornPickerState {
  /// @no-doc
  const PopcornPickerState({
    this.selectedSize,
    this.selectedFlavors = const [],
    this.flavorOptions = const [],
    this.sizeOptions = const [],
    this.selectionLimit = -1,
    this.selectedCinema,
    this.cinemaOptions = const [],
    this.brandHexColor,
  });

  /// @no-doc
  final List<PopcornFlavor> selectedFlavors;

  /// @no-doc
  final List<PopcornFlavor> flavorOptions;

  /// @no-doc
  final ItemSize? selectedSize;

  /// @no-doc
  final List<ItemSize> sizeOptions;

  /// @no-doc
  final int selectionLimit;

  /// @no-doc
  final CinemaBranch? selectedCinema;

  /// @no-doc
  final List<CinemaBranch> cinemaOptions;

  /// @no-doc
  final String? brandHexColor;

  /// @no-doc
  PopcornPickerState copyWith({
    List<PopcornFlavor>? selectedFlavors,
    ItemSize? selectedSize,
    List<PopcornFlavor>? flavorOptions,
    List<ItemSize>? sizeOptions,
    int? selectionLimit,
    CinemaBranch? selectedCinema,
    List<CinemaBranch>? cinemaOptions,
    String? brandHexColor,
  }) {
    return PopcornPickerState(
      selectedSize: selectedSize ?? this.selectedSize,
      selectedFlavors: selectedFlavors ?? this.selectedFlavors,
      flavorOptions: flavorOptions ?? this.flavorOptions,
      sizeOptions: sizeOptions ?? this.sizeOptions,
      selectionLimit: selectionLimit ?? this.selectionLimit,
      selectedCinema: selectedCinema ?? this.selectedCinema,
      cinemaOptions: cinemaOptions ?? this.cinemaOptions,
      brandHexColor: brandHexColor ?? this.brandHexColor,
    );
  }
}
