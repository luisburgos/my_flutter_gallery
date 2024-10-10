/// @no-doc
class PopcornFlavor {
  /// @no-doc
  const PopcornFlavor({
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
}
