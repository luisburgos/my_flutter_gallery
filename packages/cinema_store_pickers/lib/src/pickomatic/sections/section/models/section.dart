import 'package:cinema_store_pickers/src/pickomatic/pickomatic_item.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/section/models/section_option.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/section/models/selectiong_config.dart';

/// @no-doc
class PickOMaticSectionWrapper {
  /// @no-doc
  static PickOMaticSection<PickOMaticItem> build({
    required String id,
    required String title,
    required List<PickOMaticItem> items,
    OnSelectedChanged? onSelectedChanged,
    int selectionLimit = 1,
    List<PickOMaticSectionOption>? initialSelection,
    bool withPreview = false,
  }) {
    return PickOMaticSection<PickOMaticItem>(
      id: '$id-section-$selectionLimit',
      title: title,
      withPreview: withPreview,
      onSelectedChanged: onSelectedChanged,
      initialSelection: initialSelection?.first ??
          PickOMaticSectionOption(
            name: items.first.name,
            iconName: items.first.iconName ?? '',
            priceTag: '',
          ),
      selectionConfig: PickOMaticSelectionConfig(selectionLimit),
      options: items.map((item) {
        return PickOMaticSectionOption(
          name: item.name,
          iconName: item.iconName ?? '',
          priceTag: '',
        );
      }).toList(),
    );
  }
}

/// @no-doc
typedef OnSelectedChanged = void Function(List<PickOMaticSectionOption>);

/// @no-doc
class PickOMaticSection<T> {
  /// @no-doc
  const PickOMaticSection({
    required this.id,
    required this.title,
    required this.options,
    this.onSelectedChanged,
    this.selectionConfig = const PickOMaticSelectionConfig(1),
    this.initialSelection,
    this.withPreview = false,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String title;

  /// @no-doc
  final PickOMaticSelectionConfig selectionConfig;

  /// @no-doc
  final List<PickOMaticSectionOption> options;

  /// @no-doc
  final PickOMaticSectionOption? initialSelection;

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
