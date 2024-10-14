/// @no-doc
class CustomizationSectionOption<T> {
  /// @no-doc
  const CustomizationSectionOption(this.data);

  /// @no-doc
  final T data;
}

/// @no-doc
mixin CustomizationSectionSelectionMode {
  /// @no-doc
  int get selectionLimit;
}

/// @no-doc
class SingleCustomizationSectionSelectionMode
    with CustomizationSectionSelectionMode {
  /// @no-doc
  const SingleCustomizationSectionSelectionMode();
  @override
  int get selectionLimit => 1;
}

/// @no-doc
class MultipleCustomizationSectionSelectionMode
    with CustomizationSectionSelectionMode {
  /// @no-doc
  const MultipleCustomizationSectionSelectionMode(this.limit);

  /// @no-doc
  final int limit;

  @override
  int get selectionLimit => limit;
}

/// @no-doc
class CustomizationSection<T> {
  /// @no-doc
  const CustomizationSection({
    required this.id,
    required this.title,
    required this.options,
    this.selectionMode = const SingleCustomizationSectionSelectionMode(),
    this.currentSelection,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String title;

  /// @no-doc
  final CustomizationSectionSelectionMode selectionMode;

  /// @no-doc
  final List<CustomizationSectionOption<T>> options;

  /// @no-doc
  final ItemSelection<T>? currentSelection;
}

/// @no-doc
class ItemSelection<T> {
  /// @no-doc
  const ItemSelection(this.data);

  /// @no-doc
  final T data;
}
