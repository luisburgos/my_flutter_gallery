import 'package:my_flutter_gallery/clones/popcorn_flavor_picker/popcorn_flavor_model.dart';

class PopcornFlavorPickerModel {
  const PopcornFlavorPickerModel({
    this.selected = const [],
    this.options = const [],
    this.selectionLimit = -1,
  });

  final List<PopcornFlavor> selected;
  final List<PopcornFlavor> options;
  final int selectionLimit;

  PopcornFlavorPickerModel copyWith({
    List<PopcornFlavor>? selected,
    List<PopcornFlavor>? options,
    int? selectionLimit,
  }) {
    return PopcornFlavorPickerModel(
      selected: selected ?? this.selected,
      options: options ?? this.options,
      selectionLimit: selectionLimit ?? this.selectionLimit,
    );
  }
}
