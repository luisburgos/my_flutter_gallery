import 'package:cinema_store_pickers/src/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @no-doc
class CinemaBranchSegmentedControl extends StatelessWidget {
  /// @no-doc
  const CinemaBranchSegmentedControl({
    required this.options,
    required this.selectedCinema,
    required this.onSetSelectedCinema,
    required this.color,
    this.padding = EdgeInsets.zero,
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

  /// @no-doc
  final EdgeInsetsGeometry? padding;

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
      padding: padding,
      groupValue: selectedCinema,
      selectedColor: color,
      borderColor: color,
      children: segmentedCinemaOptions,
      onValueChanged: onSetSelectedCinema,
    );
  }
}
