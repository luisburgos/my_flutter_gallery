import 'package:equatable/equatable.dart';
import 'package:store_picker/src/engine/models/picker_engine_item_id.dart';

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
