import 'package:cinema_store_pickers/src/models/models.dart';

/// @no-doc
class CinemaStoreState {
  /// @no-doc
  const CinemaStoreState({
    this.selectedCinema,
    this.cinemaOptions = const [],
    this.brandHexColor,
  });

  /// @no-doc
  final CinemaBranch? selectedCinema;

  /// @no-doc
  final List<CinemaBranch> cinemaOptions;

  /// @no-doc
  final String? brandHexColor;

  /// @no-doc
  CinemaStoreState copyWith({
    CinemaBranch? selectedCinema,
    List<CinemaBranch>? cinemaOptions,
    String? brandHexColor,
  }) {
    return CinemaStoreState(
      selectedCinema: selectedCinema ?? this.selectedCinema,
      cinemaOptions: cinemaOptions ?? this.cinemaOptions,
      brandHexColor: brandHexColor ?? this.brandHexColor,
    );
  }
}
