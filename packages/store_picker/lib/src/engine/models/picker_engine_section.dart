import 'package:store_picker/src/engine/models/models.dart';

/// @no-doc
typedef OnSelectedChanged = void Function(List<PickerEngineItem>);

/// @no-doc
class PickerEngineSection {
  /// @no-doc
  const PickerEngineSection({
    required this.id,
    required this.title,
    required this.options,
    this.onSelectedChanged,
    this.selectionConfig = const PickerEngineSelectionConfig(1),
    this.initialSelection,
    this.withPreview = false,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String title;

  /// @no-doc
  final PickerEngineSelectionConfig selectionConfig;

  /// @no-doc
  final List<PickerEngineItem> options;

  /// @no-doc
  final PickerEngineItem? initialSelection;

  /// @no-doc
  final bool withPreview;

  /// @no-doc
  final OnSelectedChanged? onSelectedChanged;

  /// @no-doc
  int get selectionModeLimit => selectionConfig.limit;

  /// @no-doc
  bool get isMultipleSelectionMode {
    return selectionConfig.limit > 1;
  }
}
