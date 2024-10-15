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
    void Function(PickOMaticSectionOption option)? onSelected,
    int selectionLimit = 1,
    PickOMaticSectionOption? initialSelection,
    bool withPreview = false,
  }) {
    return PickOMaticSection<PickOMaticItem>(
      id: '$id-section-$selectionLimit',
      title: title,
      withPreview: withPreview,
      onSelected: onSelected,
      initialSelection: initialSelection ??
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
class PickOMaticSection<T> {
  /// @no-doc
  const PickOMaticSection({
    required this.id,
    required this.title,
    required this.options,
    this.onSelected,
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
  final void Function(PickOMaticSectionOption)? onSelected;

  /// @no-doc
  int get selectionModeLimit => selectionConfig.limit;

  /// @no-doc
  bool get isMultipleSelectionMode {
    return selectionConfig.limit > 1;
  }
}
