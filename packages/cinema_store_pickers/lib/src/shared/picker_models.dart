import 'package:equatable/equatable.dart';

/// @no-doc
class PickerSectionOptionItemData extends Equatable {
  /// @no-doc
  const PickerSectionOptionItemData({
    required this.name,
    required this.iconName,
    required this.priceTag,
  });

  /// @no-doc
  final String name;

  /// @no-doc
  final String iconName;

  /// @no-doc
  final String priceTag;

  @override
  String toString() => name;

  @override
  List<Object?> get props => [name];
}
