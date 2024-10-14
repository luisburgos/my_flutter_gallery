import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/cinemas/state.dart';
import 'package:cinema_store_pickers/src/models/customization_section.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/shared/customization_section_builder.dart';
import 'package:cinema_store_pickers/src/shared/customization_section_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class BaseCinemaPickerWidget extends ConsumerStatefulWidget {
  /// @no-doc
  const BaseCinemaPickerWidget({
    required this.sections,
    super.key,
  }) : sectionsBuilder = null;

  /// @no-doc
  const BaseCinemaPickerWidget.builder({
    required this.sectionsBuilder,
    super.key,
  }) : sections = const [];

  /// @no-doc
  final List<CustomizationSection<dynamic>> sections;

  /// @no-doc
  final List<CustomizationSection<dynamic>> Function(
    CinemaStoreState,
  )? sectionsBuilder;

  @override
  BaseCinemaPickerWidgetState createState() => BaseCinemaPickerWidgetState();
}

/// @no-doc
class BaseCinemaPickerWidgetState
    extends ConsumerState<BaseCinemaPickerWidget> {
  @override
  void initState() {
    ref.read(cinemaStoreNotifierProvider.notifier).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);

    final brandColor = cinemaStore.getBrandColor(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomizationSectionBuilder(
              color: brandColor,
              sections:
                  widget.sectionsBuilder?.call(cinemaStore) ?? widget.sections,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: CustomizationSectionSummary(
            brandColor: brandColor,
            sections:
                widget.sectionsBuilder?.call(cinemaStore) ?? widget.sections,
          ),
        )
      ],
    );
  }
}
