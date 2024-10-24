import 'package:store_picker/src/stores/models/store_info.dart';

/// @no-doc
class StoresState {
  /// @no-doc
  const StoresState({
    this.selected,
    this.options = const [],
    this.brandHexColor,
  });

  /// @no-doc
  final StoreInfo? selected;

  /// @no-doc
  final List<StoreInfo> options;

  /// @no-doc
  final String? brandHexColor;

  /// @no-doc
  StoresState copyWith({
    StoreInfo? selected,
    List<StoreInfo>? options,
    String? brandHexColor,
  }) {
    return StoresState(
      selected: selected ?? this.selected,
      options: options ?? this.options,
      brandHexColor: brandHexColor ?? this.brandHexColor,
    );
  }
}
