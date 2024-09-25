import 'package:bloc/bloc.dart';
import 'package:my_flutter_gallery/legacy/clones/popcorn_flavor_picker/popcorn_flavor_model.dart';
import 'package:my_flutter_gallery/legacy/clones/popcorn_flavor_picker/popcorn_flavor_options_service.dart';
import 'package:my_flutter_gallery/legacy/clones/popcorn_flavor_picker/popcorn_flavor_picker_model.dart';

class PopcornFlavorPickerCubit extends Cubit<PopcornFlavorPickerModel> {
  PopcornFlavorPickerCubit({
    required this.optionsService,
  }) : super(const PopcornFlavorPickerModel());

  final PopcornFlavorPickerOptionsService optionsService;

  void toggleSelected(PopcornFlavor item) {
    final selected = [...state.selected];
    final isSelected = selected.contains(item);

    if (isSelected) {
      selected.remove(item);
    } else {
      if (selected.length == state.selectionLimit) return;
      selected.add(item);
    }

    emit(
      state.copyWith(
        selected: selected,
      ),
    );
  }

  Future<void> setSelectedCinema(String cinema) async {
    final config = await optionsService.getConfigForCinemaId(cinema);
    final options = await optionsService.getPopcornFlavorOptions(cinema);
    emit(
      state.copyWith(
        options: options,
        selectionLimit: config.selectionLimit,
        selectedCinema: cinema,
        selected: [],
        brandHexColor: config.brandHexColor,
      ),
    );
  }

  Future<void> loadOptions() async {
    final defaultCinema = await optionsService.getDefaultCinemaId();
    final cinemaOptions = await optionsService.getDefaultCinemas();
    final config = await optionsService.getConfigForCinemaId(defaultCinema);
    final options = await optionsService.getPopcornFlavorOptions(defaultCinema);
    emit(
      state.copyWith(
        options: options,
        selectionLimit: config.selectionLimit,
        cinemaOptions: cinemaOptions,
        selectedCinema: cinemaOptions.firstWhere(
          (_) => _ == defaultCinema,
        ),
        brandHexColor: config.brandHexColor,
      ),
    );
  }
}
