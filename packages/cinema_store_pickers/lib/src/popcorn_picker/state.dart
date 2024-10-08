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
  final List<PopcornFlavorOption> selected;

  /// @no-doc
  final List<PopcornFlavorOption> options;

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
    List<PopcornFlavorOption>? selected,
    List<PopcornFlavorOption>? options,
    int? selectionLimit,
    CinemaBranch? selectedCinema,
    List<CinemaBranch>? cinemaOptions,
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
