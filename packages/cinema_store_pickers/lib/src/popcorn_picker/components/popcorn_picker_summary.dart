import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornPickerSummary extends ConsumerWidget {
  /// @no-doc
  const PopcornPickerSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);
    final priceTag = r'$.00';

    final brandColor = popcornPicker.getBrandColor(context);
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
}
