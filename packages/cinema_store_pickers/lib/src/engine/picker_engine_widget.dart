import 'package:cinema_store_pickers/src/engine/models/models.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_sections_builder.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_sections_summary.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickerEngineWidgetState {
  /// @no-doc
  const PickerEngineWidgetState({
    this.selections = const {},
  });

  /// @no-doc
  final Map<String, List<PickerEngineItem>> selections;

  /// @no-doc
  PickerEngineWidgetState copyWith({
    Map<String, List<PickerEngineItem>>? selections,
  }) {
    return PickerEngineWidgetState(
      selections: selections ?? this.selections,
    );
  }
}

/// @no-doc
class PickerEngineWidget extends StatefulWidget {
  /// @no-doc
  const PickerEngineWidget({
    required this.sections,
    required this.color,
    required this.iconDataLocator,
    required this.onStateChanged,
    super.key,
  });

  /// @no-doc
  final List<PickerEngineSection> sections;

  /// @no-doc
  final void Function(PickerEngineWidgetState) onStateChanged;

  /// @no-doc
  final Color color;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  @override
  State<PickerEngineWidget> createState() => _PickerEngineWidgetState();
}

class _PickerEngineWidgetState extends State<PickerEngineWidget> {
  late PickerEngineWidgetState _state;

  List<PickerEngineItem> get allSelections => _state.selections.values.reduce(
        (value, element) => [...value, ...element],
      );

  @override
  void initState() {
    final initialSelections = <String, List<PickerEngineItem>>{};
    for (final section in widget.sections) {
      initialSelections[section.id] = [];
    }
    _state = PickerEngineWidgetState(selections: initialSelections);
    super.initState();
  }

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
              selected: _state.selections,
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
      if (_state.selections[sectionId] == null) return;

      final currentSectionSelection = List<PickerEngineItem>.from(
        _state.selections[sectionId]!,
      );
      if (!currentSectionSelection.contains(option)) return;
      currentSectionSelection.remove(option);
      _state.selections[sectionId] = currentSectionSelection;
    });
  }

  void _onToggleSelection(String sectionId, PickerEngineItem option) {
    final section = widget.sections.firstWhere(
      (section) => section.id == sectionId,
    );
    final isMultiple = section.isMultipleSelectionMode;

    setState(() {
      if (!isMultiple) {
        _state.selections[sectionId] = [option];
        widget.onStateChanged(_state);
        return;
      }

      if (_state.selections[sectionId] == null) return;
      if (_state.selections[sectionId]!.contains(option)) {
        _state.selections[sectionId]!.remove(option);
        widget.onStateChanged(_state);
        return;
      }

      if (_state.selections[sectionId]!.length == section.selectionModeLimit) {
        return;
      }
      _state.selections[sectionId]!.add(option);
      widget.onStateChanged(_state);
    });
  }
}
