import 'package:cinema_store_pickers/src/cinemas/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/cinemas/state.dart';
import 'package:cinema_store_pickers/src/pickomatic/pickomatic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PickOMaticWidget extends ConsumerStatefulWidget {
  /// @no-doc
  const PickOMaticWidget({
    required this.sections,
    super.key,
  }) : sectionsBuilder = null;

  /// @no-doc
  const PickOMaticWidget.builder({
    required this.sectionsBuilder,
    super.key,
  }) : sections = const [];

  /// @no-doc
  final List<PickOMaticSection<dynamic>> sections;

  /// @no-doc
  final List<PickOMaticSection<dynamic>> Function(
    CinemaStoreState,
  )? sectionsBuilder;

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
    final sections =
        widget.sectionsBuilder?.call(cinemaStore) ?? widget.sections;

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
        /*Padding(
          padding: const EdgeInsets.all(12),
          child: CustomizationSectionSummary(
            brandColor: brandColor,
            sections:
                widget.sectionsBuilder?.call(cinemaStore) ?? widget.sections,
          ),
        ),*/
      ],
    );
  }
}
