import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornPickerTitle extends ConsumerWidget {
  /// @no-doc
  const PopcornPickerTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);

    return Text(
      'Palomitas'.toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 22,
        color: popcornPicker.getBrandColor(context),
      ),
    );
  }
}
