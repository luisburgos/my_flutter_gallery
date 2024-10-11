import 'package:equatable/equatable.dart';

/// @no-doc
class ItemIce extends Equatable {
  /// @no-doc
  const ItemIce({
    required this.id,
    required this.name,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String name;

  @override
  String toString() => name;

  @override
  List<Object?> get props => [id];
}
