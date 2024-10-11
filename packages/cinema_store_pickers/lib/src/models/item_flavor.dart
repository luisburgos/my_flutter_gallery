/// @no-doc
class ItemFlavor {
  /// @no-doc
  const ItemFlavor({
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

  /// @no-doc
  @override
  String toString() => id;
}
