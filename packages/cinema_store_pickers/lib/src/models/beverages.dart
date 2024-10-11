/// @no-doc
class Beverage {
  /// @no-doc
  const Beverage({
    required this.name,
    required this.prices,
    required this.iconName,
  });

  /// @no-doc
  final String name;

  /// @no-doc
  final Map<String, double> prices;

  /// @no-doc
  final String iconName;

  /// @no-doc
  @override
  String toString() => name;

  /// @no-doc
  double getPriceBySize(String sizeId) {
    return prices[sizeId] ?? 0;
  }
}
