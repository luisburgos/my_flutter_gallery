/// @no-doc
class CinemaBranch {
  /// @no-doc
  const CinemaBranch({
    required this.id,
    required this.name,
    required this.selectionLimit,
    required this.brandHexColor,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String name;

  /// @no-doc
  final int selectionLimit;

  /// @no-doc
  final String brandHexColor;

  /// @no-doc
  @override
  String toString() => name;
}
