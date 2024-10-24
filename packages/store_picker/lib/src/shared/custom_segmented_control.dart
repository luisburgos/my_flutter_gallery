import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @no-doc
class CustomSegmentedControlOption extends Equatable {
  /// @no-doc
  const CustomSegmentedControlOption({required this.label});

  /// @no-doc
  final String label;

  @override
  List<Object?> get props => [label];
}

/// @no-doc
class CustomSegmentedControl extends StatelessWidget {
  /// @no-doc
  const CustomSegmentedControl({
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
    required this.color,
    this.padding = EdgeInsets.zero,
    this.labelPadding = const EdgeInsets.all(8),
    this.labelTextStyle = const TextStyle(
      fontSize: 8,
    ),
    this.fillWidth = true,
    super.key,
  });

  /// @no-doc
  final List<CustomSegmentedControlOption> options;

  /// @no-doc
  final CustomSegmentedControlOption selectedOption;

  /// @no-doc
  final void Function(CustomSegmentedControlOption) onOptionSelected;

  /// @no-doc
  final Color color;

  /// @no-doc
  final TextStyle labelTextStyle;

  /// @no-doc
  final EdgeInsetsGeometry labelPadding;

  /// @no-doc
  final EdgeInsetsGeometry? padding;

  /// @no-doc
  final bool fillWidth;

  @override
  Widget build(BuildContext context) {
    if (options.isEmpty) {
      return const CircularProgressIndicator();
    }

    final segmentedOptions = {
      for (final option in options)
        option: Padding(
          padding: labelPadding,
          child: Text(
            option.label,
            style: labelTextStyle,
          ),
        ),
    };

    final child = CupertinoSegmentedControl(
      padding: padding,
      groupValue: selectedOption,
      selectedColor: color,
      borderColor: color,
      children: segmentedOptions,
      onValueChanged: onOptionSelected,
    );

    if (fillWidth) {
      return SizedBox(
        width: double.infinity,
        child: child,
      );
    }

    return child;
  }
}
