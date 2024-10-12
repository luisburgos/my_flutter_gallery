import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/data/fake_customization_sections.dart';
import 'package:cinema_store_pickers/src/models/customization_section.dart';
import 'package:cinema_store_pickers/src/models/item_flavor.dart';
import 'package:cinema_store_pickers/src/models/item_ice.dart';
import 'package:cinema_store_pickers/src/models/item_size.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:cinema_store_pickers/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';

/// @no-doc
class SodaPickerWidget extends ConsumerStatefulWidget {
  /// @no-doc
  const SodaPickerWidget({super.key});

  @override
  SodaPickerWidgetState createState() => SodaPickerWidgetState();
}

/// @no-doc
class SodaPickerWidgetState extends ConsumerState<SodaPickerWidget> {
  @override
  void initState() {
    ref.read(cinemaStoreNotifierProvider.notifier).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomizationSectionBuilder(
              color: cinemaStore.getBrandColor(context),
              sections: [
                sodaSizeSection,
                sodaFlavorSection,
                sodaIceSection,
              ],
            ),
          ),
        ),
        const Divider(),
        /*Padding(
          padding: EdgeInsets.all(12),
          child: PopcornPickerSummary(),
        )*/
      ],
    );
  }
}

/// @no-doc
class CustomizationSectionBuilder extends StatelessWidget {
  /// @no-doc
  const CustomizationSectionBuilder({
    required this.sections,
    required this.color,
    super.key,
  });

  /// @no-doc
  final List<CustomizationSection<dynamic>> sections;

  /// @no-doc
  final Color color;

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[];
    for (final section in sections) {
      slivers.addAll(
        [
          SliverToBoxAdapter(
            child: CustomizationSectionView(
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

/// @no-doc
class CustomizationSectionView<T> extends StatelessWidget {
  /// @no-doc
  const CustomizationSectionView({
    required this.section,
    required this.color,
    super.key,
  });

  /// @no-doc
  final CustomizationSection<T> section;

  /// @no-doc
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PickerSectionTitle(
          section.title,
          color: color,
        ),
        const SizedBox(height: 12),
        PickerSectionOptions(
          items: section.options.map(optionToData).toList(),
          selectedItems: const [],
          onOptionTap: (option) {
            // TODO(luisburgos): call notifier
          },
          selectedColor: color,
        ),
      ],
    );
  }

  /// @no-doc
  PickerSectionOptionItemData optionToData(
    CustomizationSectionOption<T> option,
  ) {
    if (option.data is ItemFlavor) {
      final flavor = option.data as ItemFlavor;
      return PickerSectionOptionItemData(
        name: flavor.name,
        iconName: flavor.iconName,
        priceTag: flavor.price > 0
            ? Money.fromNum(
                flavor.price,
                isoCode: 'MXN',
                decimalDigits: 2,
              ).toString()
            : '',
      );
    } else if (option.data is ItemSize) {
      final size = option.data as ItemSize;
      return PickerSectionOptionItemData(
        name: size.name,
        iconName: size.iconName,
        priceTag: size.price > 0
            ? Money.fromNum(
                size.price,
                isoCode: 'MXN',
                decimalDigits: 2,
              ).toString()
            : '',
      );
    } else if (option.data is ItemIce) {
      final ice = option.data as ItemIce;
      return PickerSectionOptionItemData(
        name: ice.name,
        iconName: ice.name,
        priceTag: '',
      );
    } else {
      throw UnimplementedError(
        'Not supported runtimeType: ${option.data.runtimeType}',
      );
    }
  }
}
