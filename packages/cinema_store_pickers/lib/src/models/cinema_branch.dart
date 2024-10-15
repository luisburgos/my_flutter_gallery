import 'package:cinema_store_pickers/src/pickomatic/pickomatic_item.dart';

/// @no-doc
class CinemaBranch {
  /// @no-doc
  const CinemaBranch({
    required this.id,
    required this.name,
    required this.selectionLimit,
    required this.brandHexColor,
    required this.availablePopcornFlavors,
    required this.availablePopcornSizes,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String name;

  /// @no-doc
  final int selectionLimit;

  /// @no-doc
  final String brandHexColor;

  /// @no-doc
  final List<PickOMaticItem> availablePopcornFlavors;

  /// @no-doc
  final List<PickOMaticItem> availablePopcornSizes;

  /// @no-doc
  @override
  String toString() => name;
}
