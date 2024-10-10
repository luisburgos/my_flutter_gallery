import 'package:equatable/equatable.dart';

/// @no-doc
class PopcornSize extends Equatable {
  /// @no-doc
  const PopcornSize({
    required this.id,
    required this.name,
    required this.price,
    required this.iconName,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String name;

  /// @no-doc
  final double price;

  /// @no-doc
  final String iconName;

  @override
  String toString() => name;

  @override
  List<Object?> get props => [name];
}
