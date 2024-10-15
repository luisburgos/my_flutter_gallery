import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickOMaticSectionsViews extends StatelessWidget {
  /// @no-doc
  const PickOMaticSectionsViews({
    required this.sections,
    required this.color,
    super.key,
  });

  /// @no-doc
  final List<PickOMaticSection<dynamic>> sections;

  /// @no-doc
  final Color color;

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[];
    for (final section in sections) {
      slivers.addAll(
        [
          SliverToBoxAdapter(
            child: PickOMaticSectionView(
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
