import 'package:cinema_store_pickers/src/popcorn_picker/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @no-doc
class CinemaBranchSelector extends StatelessWidget {
  /// @no-doc
  const CinemaBranchSelector({
    required this.options,
    required this.selectedCinema,
    required this.onSetSelectedCinema,
    required this.color,
    super.key,
  });

  /// @no-doc
  final List<CinemaBranch> options;

  /// @no-doc
  final CinemaBranch selectedCinema;

  /// @no-doc
  final void Function(CinemaBranch) onSetSelectedCinema;

  /// @no-doc
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (options.isEmpty) {
      return const CircularProgressIndicator();
    }

    final segmentedCinemaOptions = {
      for (final option in options)
        option: Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Cinema ${option.name}'),
        ),
    };

    return CupertinoSegmentedControl(
      padding: const EdgeInsets.all(8),
      groupValue: selectedCinema,
      selectedColor: color,
      borderColor: color,
      children: segmentedCinemaOptions,
      onValueChanged: onSetSelectedCinema,
    );
  }
}
