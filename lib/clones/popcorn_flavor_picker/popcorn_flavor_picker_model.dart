import 'package:my_flutter_gallery/clones/popcorn_flavor_picker/popcorn_flavor_model.dart';

class PopcornFlavorPickerModel {
  const PopcornFlavorPickerModel({
    this.selected = const [],
    this.options = const [],
    this.selectionLimit = -1,
    this.selectedCinema,
    this.cinemaOptions = const [],
    this.brandHexColor,
  });

  final List<PopcornFlavor> selected;
  final List<PopcornFlavor> options;
  final int selectionLimit;
  final String? selectedCinema;
  final List<String> cinemaOptions;
  final String? brandHexColor;

  PopcornFlavorPickerModel copyWith({
    List<PopcornFlavor>? selected,
    List<PopcornFlavor>? options,
    int? selectionLimit,
    String? selectedCinema,
    List<String>? cinemaOptions,
    String? brandHexColor,
  }) {
    return PopcornFlavorPickerModel(
      selected: selected ?? this.selected,
      options: options ?? this.options,
      selectionLimit: selectionLimit ?? this.selectionLimit,
      selectedCinema: selectedCinema ?? this.selectedCinema,
      cinemaOptions: cinemaOptions ?? this.cinemaOptions,
      brandHexColor: brandHexColor ?? this.brandHexColor,
    );
  }
}
