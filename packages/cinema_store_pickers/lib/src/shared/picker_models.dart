import 'package:equatable/equatable.dart';

/// @no-doc
class PickerSectionOptionItemData extends Equatable {
  /// @no-doc
  const PickerSectionOptionItemData({
    required this.name,
  });

  /// @no-doc
  final String name;

  @override
  String toString() => name;

  @override
  List<Object?> get props => [name];
}
