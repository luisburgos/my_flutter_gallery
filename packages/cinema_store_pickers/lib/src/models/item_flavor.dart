/// @no-doc
class ItemPrice {
  /// @no-doc
  const ItemPrice();
}

/// @no-doc
class MultipleItemPrice extends ItemPrice {
  /// @no-doc
  const MultipleItemPrice({required this.prices});

  /// @no-doc
  final Map<String, double> prices;
}

/// @no-doc
class SingleItemPrice extends ItemPrice {
  /// @no-doc
  const SingleItemPrice({
    required this.price,
  });

  /// @no-doc
  final double price;
}

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
  final ItemPrice price;

  /// @no-doc
  final String iconName;

  /// @no-doc
  @override
  String toString() => id;
}
