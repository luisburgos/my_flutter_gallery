import 'package:cinema_store_pickers/src/data/fake_customization_sections.dart';
import 'package:cinema_store_pickers/src/models/customization_section.dart';
import 'package:cinema_store_pickers/src/models/item_flavor.dart';
import 'package:cinema_store_pickers/src/models/item_ice.dart';
import 'package:cinema_store_pickers/src/models/item_size.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:cinema_store_pickers/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

/// @no-doc
class SodaPickerWidget extends StatelessWidget {
  /// @no-doc
  const SodaPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomizationSectionBuilder(
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
    super.key,
  });

  /// @no-doc
  final List<CustomizationSection<dynamic>> sections;

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[];
    for (final section in sections) {
      slivers.addAll(
        [
          SliverToBoxAdapter(
            child: CustomizationSectionView(
              section: section,
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
    super.key,
  });

  /// @no-doc
  final CustomizationSection<T> section;

  @override
  Widget build(BuildContext context) {
    final brandColor = Colors.red.shade300;
    return Column(
      children: [
        PickerSectionTitle(
          section.title,
          color: brandColor,
        ),
        const SizedBox(height: 12),
        PickerSectionOptions(
          items: section.options.map(
            (option) {
              print('option: $option');
              if (option.data is ItemFlavor) {
                final flavor = option.data as ItemFlavor;
                return PickerSectionOptionItemData(
                  name: flavor.name,
                  iconName: flavor.iconName,
                  priceTag: Money.fromNum(
                    flavor.price,
                    isoCode: 'MXN',
                    decimalDigits: 2,
                  ).toString(),
                );
              } else if (option.data is ItemSize) {
                final size = option.data as ItemSize;
                return PickerSectionOptionItemData(
                  name: size.name,
                  iconName: size.iconName,
                  priceTag: Money.fromNum(
                    size.price,
                    isoCode: 'MXN',
                    decimalDigits: 2,
                  ).toString(),
                );
              } else if (option.data is ItemIce) {
                final ice = option.data as ItemIce;
                return PickerSectionOptionItemData(
                  name: ice.name,
                  iconName: ice.name,
                  priceTag: '',
                );
              } else {
                throw Exception();
              }
            },
          ).toList(),
          selectedItems: [],
          onOptionTap: (option) {
            /// Call notifier
          },
          selectedColor: brandColor,
        ),
      ],
    );
  }
}
