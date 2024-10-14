import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';

/// @no-doc
class PopcornPickerSummary extends ConsumerWidget {
  /// @no-doc
  const PopcornPickerSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);
    final price = _calculateCost(
      popcornPicker.selectedSize,
      popcornPicker.selectedFlavors,
    );
    final priceTag = Money.fromNum(
      price,
      isoCode: 'MXN',
      decimalDigits: 2,
    ).toString();

    final brandColor = cinemaStore.getBrandColor(context);
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
    ItemSize? selectedSize,
    List<ItemFlavor> selectedFlavors,
  ) {
    final sizePrice = selectedSize?.price ?? 0.0;
    var flavorsPrice = 0.0;
    for (final flavor in selectedFlavors) {
      final flavorPrices = flavor.price as MultipleItemPrice;
      final flavorPriceForSize = flavorPrices.prices[selectedSize?.id] ?? 0.0;
      if (flavorsPrice < flavorPriceForSize) {
        flavorsPrice = flavorPriceForSize;
      }
    }
    return sizePrice + flavorsPrice;
  }
}
