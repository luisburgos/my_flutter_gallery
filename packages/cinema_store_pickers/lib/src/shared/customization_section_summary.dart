import 'package:cinema_store_pickers/src/models/customization_section.dart';
import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';

/// @no-doc
class CustomizationSectionSummary extends ConsumerWidget {
  /// @no-doc
  const CustomizationSectionSummary({
    required this.sections,
    required this.brandColor,
    super.key,
  });

  /// @no-doc
  final List<CustomizationSection<dynamic>> sections;

  /// @no-doc
  final Color brandColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const selections = <ItemSelection<dynamic>>[];

    for (final section in sections) {
      if (section.currentSelection != null) {
        selections.add(section.currentSelection!);
      }
    }
    final price = _calculateCost(selections);

    final priceTag = Money.fromNum(
      price,
      isoCode: 'MXN',
      decimalDigits: 2,
    ).toString();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        'Total $priceTag',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: brandColor,
        ),
      ),
    );
  }

  double _calculateCost(
    List<ItemSelection<dynamic>> selections,
  ) {
    var totalPrice = 0.0;
    for (final selection in selections) {
      if (selection.data is ItemSize) {
        final size = selection.data as ItemSize;
        totalPrice += size.price;
        continue;
      }

      if (selection.data is ItemFlavor) {
        var flavorsPrice = 0.0;
        final flavor = selection.data as ItemFlavor;
        final flavorPrices = flavor.price as MultipleItemPrice;
        // TODO(luisburgos): fix when selection is state cached
        final flavorPriceForSize = flavorPrices.prices.values.first;
        if (flavorsPrice < flavorPriceForSize) {
          flavorsPrice = flavorPriceForSize;
        }
        continue;
      }

      throw UnimplementedError(
        'selection.data type not supported: ${selection.data.runtimeType}',
      );
    }

    return totalPrice;
  }
}
