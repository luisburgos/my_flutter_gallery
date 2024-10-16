import 'package:cinema_store_pickers/src/pickomatic/pickomatic_item.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic_selection_preview.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/section/models/section.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/section/view/pickomatic_section_options.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/section/view/pickomatic_section_title.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickOMaticSectionView<T> extends StatefulWidget {
  /// @no-doc
  const PickOMaticSectionView({
    required this.section,
    required this.color,
    super.key,
  });

  /// @no-doc
  final PickOMaticSection<T> section;

  /// @no-doc
  final Color color;

  @override
  State<PickOMaticSectionView<T>> createState() =>
      _PickOMaticSectionViewState<T>();
}

class _PickOMaticSectionViewState<T> extends State<PickOMaticSectionView<T>> {
  List<PickOMaticItem> selected = [];

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
        PickOMaticSectionTitle(
          widget.section.title,
          color: widget.color,
        ),
        const SizedBox(height: 12),
        if (widget.section.withPreview) ...[
          PickOMaticSelectionPreview(
            items: selected,
            onRemoveTap: _onRemove,
          ),
          const SizedBox(height: 12),
        ],
        PickOMaticItems(
          items: widget.section.options,
          selectedItems: selected,
          onOptionTap: _onToggleSelection,
          selectedColor: widget.color,
        ),
      ],
    );
  }

  void _onRemove(PickOMaticItem option) {
    setState(() {
      if (!selected.contains(option)) return;
      selected.remove(option);
    });
  }

  void _onToggleSelection(PickOMaticItem option) {
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
