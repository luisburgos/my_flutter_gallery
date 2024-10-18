import 'package:cinema_store_pickers/src/engine/models/models.dart';
import 'package:flutter/material.dart';

/// @no-doc
class PickerEngineSectionsSummary extends StatelessWidget {
  /// @no-doc
  const PickerEngineSectionsSummary({
    required this.brandColor,
    required this.selections,
    super.key,
  });

  /// @no-doc
  final Color brandColor;

  /// @no-doc
  final List<PickerEngineItem> selections;

  @override
  Widget build(BuildContext context) {
    var total = 0.0;
    for (final selection in selections) {
      total += selection.price ?? 0.0;
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TOTAL',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '\$$total',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
