// ignore: one_member_abstracts

import 'package:cinema_store_pickers/src/popcorn_picker/models.dart';

/// @no-doc
abstract class PopcornPickerService {
  /// @no-doc
  Future<CinemaBranch> getDefaultCinemaBranch();

  /// @no-doc
  Future<CinemaBranch> getCinemaBranchById(String cinemaId);

  /// @no-doc
  Future<List<PopcornFlavorOption>> getPopcornFlavorOptions(String cinemaId);

  /// @no-doc
  Future<List<CinemaBranch>> getDefaultCinemaBranches();
}

const _data = [
  CinemaBranch(
    id: 'A',
    name: 'A',
    selectionLimit: 2,
    brandHexColor: '003366',
  ),
  CinemaBranch(
    id: 'B',
    name: 'B',
    selectionLimit: 3,
    brandHexColor: 'E30B17',
  ),
];

/// @no-doc
class DefaultPopcornPickerService extends PopcornPickerService {
  @override
  Future<List<CinemaBranch>> getDefaultCinemaBranches() {
    return Future.value(_data);
  }

  @override
  Future<CinemaBranch> getDefaultCinemaBranch() {
    return Future.value(_data[0]);
  }

  @override
  Future<CinemaBranch> getCinemaBranchById(String cinemaId) {
    final find = _data.where((c) => c.id == cinemaId);
    if (find.isEmpty) throw Exception('');
    return Future.value(find.first);
  }

  @override
  Future<List<PopcornFlavorOption>> getPopcornFlavorOptions(String cinemaId) {
    final baseFlavors = [
      const PopcornFlavorOption(
        name: 'Mantequilla',
        iconName: 'butter',
      ),
      const PopcornFlavorOption(
        name: 'Caramelo',
        iconName: 'caramel',
      ),
    ];

    var cinemaFlavors = <PopcornFlavorOption>[];
    if (cinemaId == 'A') {
      cinemaFlavors = [
        const PopcornFlavorOption(
          name: 'Doritos® Nachos',
          iconName: 'nacho',
        ),
        const PopcornFlavorOption(
          name: 'Cheetos Torciditos®',
          iconName: 'stick',
        ),
        const PopcornFlavorOption(
          name: 'Takis® Blue',
          iconName: 'blue_stick',
        ),
      ];
    }

    if (cinemaId == 'B') {
      cinemaFlavors = [
        const PopcornFlavorOption(
          name: 'Chips Jalapeño®',
          iconName: 'pepper',
        ),
        const PopcornFlavorOption(
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
