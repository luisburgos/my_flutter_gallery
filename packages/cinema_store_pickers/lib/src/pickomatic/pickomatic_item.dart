import 'package:equatable/equatable.dart';

/// @no-doc
class PickOMaticItemId extends Equatable {
  /// @no-doc
  const PickOMaticItemId(this.value);

  /// @no-doc
  final String value;

  @override
  List<Object?> get props => [value];
}

/// @no-doc
class PickOMaticItem extends Equatable {
  /// @no-doc
  const PickOMaticItem({
    required this.id,
    required this.name,
    this.iconName,
    this.price,
  });

  /// @no-doc
  final PickOMaticItemId id;

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
  PickOMaticItem copyWith({
    PickOMaticItemId? id,
    String? name,
    String? iconName,
    double? price,
  }) {
    return PickOMaticItem(
      id: id ?? this.id,
      name: name ?? this.name,
      iconName: iconName ?? this.iconName,
      price: price ?? this.price,
    );
  }
}
