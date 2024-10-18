import 'package:cinema_store_pickers/src/engine/models/models.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_sections_builder.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_sections_summary.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickerEngineWidget extends StatefulWidget {
  /// @no-doc
  const PickerEngineWidget({
    required this.sections,
    required this.color,
    required this.iconDataLocator,
    super.key,
  });

  /// @no-doc
  final List<PickerEngineSection<dynamic>> sections;

  /// @no-doc
  final Color color;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  @override
  State<PickerEngineWidget> createState() => _PickerEngineWidgetState();
}

class _PickerEngineWidgetState extends State<PickerEngineWidget> {
  late Map<String, List<PickerEngineItem>> _selected;

  @override
  void initState() {
    _selected = {};
    for (final section in widget.sections) {
      _selected = {
        section.id: [],
      };
    }
    super.initState();
  }

  List<PickerEngineItem> get allSelections => _selected.values.reduce(
        (value, element) => [...value, ...element],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: PickerEngineSectionsBuilder(
              color: widget.color,
              sections: widget.sections,
              iconDataLocator: widget.iconDataLocator,
              selected: _selected,
              onToggleSelection: _onToggleSelection,
              onRemove: _onRemove,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: PickerEngineSectionsSummary(
            brandColor: widget.color,
            selections: allSelections,
          ),
        ),
      ],
    );
  }

  void _onRemove(String sectionId, PickerEngineItem option) {
    setState(() {
      if (_selected[sectionId] == null) return;

      final currentSectionSelection = List<PickerEngineItem>.from(
        _selected[sectionId]!,
      );
      if (!currentSectionSelection.contains(option)) return;
      currentSectionSelection.remove(option);
      _selected[sectionId] = currentSectionSelection;
    });
  }

  void _onToggleSelection(String sectionId, PickerEngineItem option) {
    final section = widget.sections.firstWhere(
      (section) => section.id == sectionId,
    );
    final isMultiple = section.isMultipleSelectionMode;

    setState(() {
      if (!isMultiple) {
        _selected[sectionId] = [option];
        return;
      }

      if (_selected[sectionId] == null) return;
      if (_selected[sectionId]!.contains(option)) {
        _selected[sectionId]!.remove(option);
        return;
      }

      print('section: $section');
      if (_selected[sectionId]!.length == section.selectionModeLimit) return;
      _selected[sectionId]!.add(option);
    });
  }
}
