import 'package:cinema_store_pickers/src/engine/models/models.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_sections_view.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickerEngineSectionsBuilder extends StatelessWidget {
  /// @no-doc
  const PickerEngineSectionsBuilder({
    required this.sections,
    required this.color,
    required this.iconDataLocator,
    required this.selected,
    required this.onRemove,
    required this.onToggleSelection,
    super.key,
  });

  /// @no-doc
  final List<PickerEngineSection<dynamic>> sections;

  /// @no-doc
  final Map<String, List<PickerEngineItem>> selected;

  /// @no-doc
  final void Function(String sectionId, PickerEngineItem option) onRemove;

  /// @no-doc
  final void Function(
    String sectionId,
    PickerEngineItem option,
  ) onToggleSelection;

  /// @no-doc
  final Color color;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[];
    for (final section in sections) {
      slivers.addAll(
        [
          SliverToBoxAdapter(
            child: DefaultPickerEngineSectionView(
              key: Key('section-view-${section.id}'),
              title: section.title,
              withPreview: section.withPreview,
              color: color,
              iconDataLocator: iconDataLocator,
              options: section.options,
              selected: selected[section.id] ?? [],
              onRemove: (item) => onRemove(section.id, item),
              onToggleSelection: (item) => onToggleSelection(section.id, item),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      );
    }

    return CustomScrollView(slivers: slivers);
  }
}
