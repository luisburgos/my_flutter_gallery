// ignore: one_member_abstracts
import 'package:my_flutter_gallery/clones/popcorn_flavor_picker/popcorn_flavor_model.dart';

class PopcornFlavorPickerConfig {
  PopcornFlavorPickerConfig({
    required this.cinemaId,
    required this.selectionLimit,
    required this.brandHexColor,
  });

  final String cinemaId;
  final int selectionLimit;
  final String brandHexColor;
}

abstract class PopcornFlavorPickerOptionsService {
  Future<String> getDefaultCinemaId();

  Future<PopcornFlavorPickerConfig> getConfigForCinemaId(String cinemaId);

  Future<List<PopcornFlavor>> getPopcornFlavorOptions(String cinemaId);

  Future<List<String>> getDefaultCinemas();
}

class DefaultPopcornFlavorPickerOptionsService
    extends PopcornFlavorPickerOptionsService {
  @override
  Future<List<String>> getDefaultCinemas() {
    return Future.value(['A', 'B']);
  }

  @override
  Future<String> getDefaultCinemaId() {
    return Future.value('B');
  }

  @override
  Future<PopcornFlavorPickerConfig> getConfigForCinemaId(String cinemaId) {
    if (cinemaId == 'A') {
      return Future.value(
        PopcornFlavorPickerConfig(
          cinemaId: 'A',
          selectionLimit: 2,
          brandHexColor: '003366',
        ),
      );
    }

    return Future.value(
      PopcornFlavorPickerConfig(
        cinemaId: 'B',
        selectionLimit: 3,
        brandHexColor: 'E30B17',
      ),
    );
  }

  @override
  Future<List<PopcornFlavor>> getPopcornFlavorOptions(String cinemaId) {
    final baseFlavors = [
      const PopcornFlavor(
        name: 'Mantequilla',
        iconName: 'butter',
      ),
      const PopcornFlavor(
        name: 'Caramelo',
        iconName: 'caramel',
      ),
    ];

    var cinemaFlavors = <PopcornFlavor>[];
    if (cinemaId == 'A') {
      cinemaFlavors = [
        const PopcornFlavor(
          name: 'Doritos® Nachos',
          iconName: 'nacho',
        ),
        const PopcornFlavor(
          name: 'Cheetos Torciditos®',
          iconName: 'stick',
        ),
        const PopcornFlavor(
          name: 'Takis® Blue',
          iconName: 'blue_stick',
        ),
      ];
    }

    if (cinemaId == 'B') {
      cinemaFlavors = [
        const PopcornFlavor(
          name: 'Chips Jalapeño®',
          iconName: 'pepper',
        ),
        const PopcornFlavor(
          name: 'Ruffles Queso®',
          iconName: 'cheese',
        ),
      ];
    }

    return Future.value(
      [
        ...baseFlavors,
        ...cinemaFlavors,
      ],
    );
  }
}
