import 'package:cinema_store_pickers/src/popcorn_picker/models.dart';

/// @no-doc
class PopcornPickerState {
  /// @no-doc
  const PopcornPickerState({
    this.selected = const [],
    this.options = const [],
    this.selectionLimit = -1,
    this.selectedCinema,
    this.cinemaOptions = const [],
    this.brandHexColor,
  });

  /// @no-doc
  final List<PopcornFlavor> selected;

  /// @no-doc
  final List<PopcornFlavor> options;

  /// @no-doc
  final int selectionLimit;

  /// @no-doc
  final String? selectedCinema;

  /// @no-doc
  final List<String> cinemaOptions;

  /// @no-doc
  final String? brandHexColor;

  /// @no-doc
  PopcornPickerState copyWith({
    List<PopcornFlavor>? selected,
    List<PopcornFlavor>? options,
    int? selectionLimit,
    String? selectedCinema,
    List<String>? cinemaOptions,
    String? brandHexColor,
  }) {
    return PopcornPickerState(
      selected: selected ?? this.selected,
      options: options ?? this.options,
      selectionLimit: selectionLimit ?? this.selectionLimit,
      selectedCinema: selectedCinema ?? this.selectedCinema,
      cinemaOptions: cinemaOptions ?? this.cinemaOptions,
      brandHexColor: brandHexColor ?? this.brandHexColor,
    );
  }
}
