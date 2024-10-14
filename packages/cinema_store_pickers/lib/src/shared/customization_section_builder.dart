import 'package:cinema_store_pickers/src/models/customization_section.dart';
import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:cinema_store_pickers/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

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
class CustomizationSectionView<T> extends StatefulWidget {
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
  State<CustomizationSectionView<T>> createState() =>
      _CustomizationSectionViewState<T>();
}

class _CustomizationSectionViewState<T>
    extends State<CustomizationSectionView<T>> {
  List<PickerSectionOptionItemData> selected = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PickerSectionTitle(
          widget.section.title,
          color: widget.color,
        ),
        const SizedBox(height: 12),
        PickerSectionOptions(
          items: widget.section.options.map(optionToData).toList(),
          selectedItems: selected,
          onOptionTap: (option) {
            setState(() {
              if (widget.section.selectionMode.isMultiple) {
                if (selected.contains(option)) {
                  selected.remove(option);
                } else {
                  selected.add(option);
                }
              } else {
                selected = [option];
              }
            });
          },
          selectedColor: widget.color,
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
      if (flavor.price is SingleItemPrice) {
        final flavorPrice = (flavor.price as SingleItemPrice).price;
        return PickerSectionOptionItemData(
          name: flavor.name,
          iconName: flavor.iconName,
          priceTag: flavorPrice > 0
              ? Money.fromNum(
                  flavorPrice,
                  isoCode: 'MXN',
                  decimalDigits: 2,
                ).toString()
              : '',
        );
      }

      if (flavor.price is MultipleItemPrice) {
        final flavorPrices = (flavor.price as MultipleItemPrice).prices;
        // TODO(luisburgos): fix when selection is saved on state
        //final flavorPrice = flavorPrices[selectedSize?.id] ?? 0.0;
        final flavorPrice = flavorPrices.values.first;

        return PickerSectionOptionItemData(
          name: flavor.name,
          iconName: flavor.iconName,
          priceTag: flavorPrice > 0
              ? Money.fromNum(
                  flavorPrice,
                  isoCode: 'MXN',
                  decimalDigits: 2,
                ).toString()
              : '',
        );
      }

      throw UnimplementedError(
        'Flavor price type NOT supported: ${flavor.price.runtimeType}',
      );
    }

    if (option.data is ItemSize) {
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
    }

    if (option.data is ItemIce) {
      final ice = option.data as ItemIce;
      return PickerSectionOptionItemData(
        name: ice.name,
        iconName: ice.name,
        priceTag: '',
      );
    }

    throw UnimplementedError(
      'Not supported runtimeType: ${option.data.runtimeType}',
    );
  }
}
