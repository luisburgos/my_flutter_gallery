import 'package:cinema_store_pickers/src/engine/sections/section/models/models.dart';
import 'package:cinema_store_pickers/src/engine/sections/section/view/picker_engine_section.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickerEngineSectionsViews extends StatelessWidget {
  /// @no-doc
  const PickerEngineSectionsViews({
    required this.sections,
    required this.color,
    super.key,
  });

  /// @no-doc
  final List<PickerEngineSection<dynamic>> sections;

  /// @no-doc
  final Color color;

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[];
    for (final section in sections) {
      slivers.addAll(
        [
          SliverToBoxAdapter(
            child: PickerEngineSectionView(
              key: Key('${section.id}-section-view'),
              section: section,
              color: color,
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
