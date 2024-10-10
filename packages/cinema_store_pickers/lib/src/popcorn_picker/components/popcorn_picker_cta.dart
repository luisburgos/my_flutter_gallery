import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class PopcornPickerCta extends ConsumerWidget {
  /// @no-doc
  const PopcornPickerCta({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);
    final priceTag = r'$.00';

    final brandColor = popcornPicker.getBrandColor(context);
    return ShadButton(
      size: ShadButtonSize.sm,
      backgroundColor: brandColor,
      hoverBackgroundColor: brandColor.withOpacity(0.9),
      onPressed: () {},
      child: Text(
        'Añadir por $priceTag',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
