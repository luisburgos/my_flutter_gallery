import 'package:cinema_store_pickers/src/engine/models/models.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_section_items.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_section_preview.dart';
import 'package:cinema_store_pickers/src/engine/view/picker_engine_section_title.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickerEngineSectionView<T> extends StatefulWidget {
  /// @no-doc
  const PickerEngineSectionView({
    required this.section,
    required this.color,
    required this.iconDataLocator,
    super.key,
  });

  /// @no-doc
  final PickerEngineSection<T> section;

  /// @no-doc
  final Color color;

  /// @no-doc
  final IconDataLocator iconDataLocator;

  @override
  State<PickerEngineSectionView<T>> createState() =>
      _PickerEngineSectionViewState<T>();
}

class _PickerEngineSectionViewState<T>
    extends State<PickerEngineSectionView<T>> {
  List<PickerEngineItem> selected = [];

  @override
  void initState() {
    final initialSelection = widget.section.initialSelection;
    if (initialSelection != null) {
      selected = [initialSelection];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PickerEngineSectionTitle(
          widget.section.title,
          color: widget.color,
        ),
        const SizedBox(height: 12),
        if (widget.section.withPreview) ...[
          PickerEngineSectionPreview(
            items: selected,
            onRemoveTap: _onRemove,
            iconDataLocator: widget.iconDataLocator,
          ),
          const SizedBox(height: 12),
        ],
        PickerEngineSectionItems(
          items: widget.section.options,
          selectedItems: selected,
          onOptionTap: _onToggleSelection,
          selectedColor: widget.color,
          iconDataLocator: widget.iconDataLocator,
        ),
      ],
    );
  }

  void _onRemove(PickerEngineItem option) {
    setState(() {
      if (!selected.contains(option)) return;
      selected.remove(option);
    });
  }

  void _onToggleSelection(PickerEngineItem option) {
    final isMultiple = widget.section.isMultipleSelectionMode;

    setState(() {
      if (!isMultiple) {
        selected = [option];
        widget.section.onSelectedChanged?.call(selected);
        return;
      }

      if (selected.contains(option)) {
        selected.remove(option);
        widget.section.onSelectedChanged?.call(selected);
        return;
      }

      if (selected.length == widget.section.selectionModeLimit) return;
      selected.add(option);
      widget.section.onSelectedChanged?.call(selected);
    });
  }
}
