import 'package:equatable/equatable.dart';

/// @no-doc
class PickerEngineItemId extends Equatable {
  /// @no-doc
  const PickerEngineItemId(this.value);

  /// @no-doc
  final String value;

  @override
  List<Object?> get props => [value];
}

/// @no-doc
class PickerEngineItem extends Equatable {
  /// @no-doc
  const PickerEngineItem({
    required this.id,
    required this.name,
    this.iconName,
    this.price,
  });

  /// @no-doc
  final PickerEngineItemId id;

  /// @no-doc
  final String name;

  /// @no-doc
  final String? iconName;

  /// @no-doc
  final double? price;

  @override
  List<Object?> get props => [id];

  /// @no-doc
  @override
  String toString() => '${id.value}-$name';

  /// @no-doc
  PickerEngineItem copyWith({
    PickerEngineItemId? id,
    String? name,
    String? iconName,
    double? price,
  }) {
    return PickerEngineItem(
      id: id ?? this.id,
      name: name ?? this.name,
      iconName: iconName ?? this.iconName,
      price: price ?? this.price,
    );
  }
}
