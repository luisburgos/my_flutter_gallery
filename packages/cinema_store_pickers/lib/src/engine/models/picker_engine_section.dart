import 'package:cinema_store_pickers/src/engine/models/models.dart';

/// @no-doc
class PickerEngineSectionWrapper {
  /// @no-doc
  static PickerEngineSection<PickerEngineItem> build({
    required String id,
    required String title,
    required List<PickerEngineItem> items,
    OnSelectedChanged? onSelectedChanged,
    int selectionLimit = 1,
    List<PickerEngineItem>? initialSelection,
    bool withPreview = false,
  }) {
    PickerEngineItem? selection = items.first;
    if (initialSelection != null) {
      if (initialSelection.isEmpty) {
        selection = null;
      } else {
        selection = initialSelection.first;
      }
    }

    return PickerEngineSection<PickerEngineItem>(
      id: '$id-section-$selectionLimit',
      title: title,
      withPreview: withPreview,
      onSelectedChanged: onSelectedChanged,
      initialSelection: selection,
      selectionConfig: PickerEngineSelectionConfig(selectionLimit),
      options: items,
    );
  }
}

/// @no-doc
typedef OnSelectedChanged = void Function(List<PickerEngineItem>);

/// @no-doc
class PickerEngineSection<T> {
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
