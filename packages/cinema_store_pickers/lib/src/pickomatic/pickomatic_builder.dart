import 'package:cinema_store_pickers/src/cinemas/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:cinema_store_pickers/src/pickomatic/sections/pickomatic_selection_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PickOMaticWidget extends ConsumerStatefulWidget {
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
  PickOMaticWidgetState createState() => PickOMaticWidgetState();
}

/// @no-doc
class PickOMaticWidgetState extends ConsumerState<PickOMaticWidget> {
  @override
  void initState() {
    ref.read(cinemaStoreNotifierProvider.notifier).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);
    final sections = widget.sections;

    final brandColor = cinemaStore.getBrandColor(context);
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
            selections: widget.selections ?? [],
          ),
        ),
      ],
    );
  }
}
