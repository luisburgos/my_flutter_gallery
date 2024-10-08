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
}

/// @no-doc
enum PopcornSize {
  /// @no-doc
  small,

  /// @no-doc
  medium,

  /// @no-doc
  large,

  /// @no-doc
  family;

  /// @no-doc
  bool get isSmall => this == PopcornSize.small;

  /// @no-doc
  bool get isMedium => this == PopcornSize.medium;

  /// @no-doc
  bool get isLarge => this == PopcornSize.large;

  /// @no-doc
  bool get isFamily => this == PopcornSize.family;
}

/// @no-doc
class PopcornFlavorOption {
  /// @no-doc
  const PopcornFlavorOption({
    required this.name,
    required this.iconName,
  });

  /// @no-doc
  final String name;

  /// @no-doc
  final String iconName;
}
