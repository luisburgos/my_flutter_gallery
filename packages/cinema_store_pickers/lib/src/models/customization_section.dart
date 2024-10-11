import 'package:cinema_store_pickers/src/data/fake_customization_sections.dart';

/// @no-doc
class CustomizationSectionOption<T> {
  /// @no-doc
  const CustomizationSectionOption(this.data);

  /// @no-doc
  final T data;
}

/// @no-doc
enum CustomizationSectionSelectionMode {
  /// @no-doc
  single,

  /// @no-doc
  multiple;

  /// @no-doc
  bool get isMultiple => this == CustomizationSectionSelectionMode.multiple;
}

/// @no-doc
class CustomizationSection<T> {
  /// @no-doc
  const CustomizationSection({
    required this.id,
    required this.title,
    required this.selectionMode,
    required this.options,
    required this.transformer,
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
  final CustomizationSectionOptionTransformer<T> transformer;
}
