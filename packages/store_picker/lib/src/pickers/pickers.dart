import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:store_picker/src/shared/custom_segmented_control.dart';

/// @no-doc
class PickerItem extends Equatable {
  /// @no-doc
  const PickerItem({
    required this.name,
    required this.builder,
    this.isEnabled = true,
  });

  /// @no-doc
  final String name;

  /// @no-doc
  final bool isEnabled;

  /// @no-doc
  final Widget Function() builder;

  @override
  List<Object?> get props => [name];
}

/// @no-doc
class PickersWidget extends StatefulWidget {
  /// @no-doc
  const PickersWidget({
    required this.pickers,
    required this.brandColor,
    super.key,
  });

  /// @no-doc
  final List<PickerItem> pickers;

  /// @no-doc
  final Color brandColor;

  @override
  State<PickersWidget> createState() => _PickersWidgetState();
}

class _PickersWidgetState extends State<PickersWidget> {
  /// @no-doc
  late PickerItem selectedOption;

  @override
  void initState() {
    selectedOption = widget.pickers.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pickers = widget.pickers;
    final options = pickers
        .map(
          (picker) => CustomSegmentedControlOption(label: picker.name),
        )
        .toList();

    if (options.isEmpty) return const CircularProgressIndicator();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 8,
          ),
          child: CustomSegmentedControl(
            options: options,
            selectedOption: CustomSegmentedControlOption(
              label: selectedOption.name,
            ),
            onOptionSelected: (option) {
              final picker = pickers.firstWhere(
                (picker) => picker.name == option.label,
              );
              setState(() {
                selectedOption = picker;
              });
            },
            color: widget.brandColor,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                height: 1.21,
              ),
              children: [
                const TextSpan(
                  text: 'Personaliza tus: ',
                ),
                TextSpan(
                  text: selectedOption.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: selectedOption.builder(),
        ),
      ],
    );
  }
}
