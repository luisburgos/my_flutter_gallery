import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/pickomatic_selection_summary.dart';
import 'package:cinema_store_pickers/src/stores/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PickOMaticWidget extends ConsumerWidget {
  /// @no-doc
  const PickOMaticWidget({
    required this.sections,
    this.selections,
    super.key,
  });

  /// @no-doc
  final List<PickOMaticSection<dynamic>> sections;

  /// @no-doc
  final List<PickOMaticItem>? selections;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stores = ref.watch(storesControllerNotifierProvider);

    final brandColor = stores.getBrandColor(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: PickOMaticSectionsViews(
              color: brandColor,
              sections: sections,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: PickOMaticSelectionSummary(
            brandColor: brandColor,
            selections: selections ?? [],
          ),
        ),
      ],
    );
  }
}
