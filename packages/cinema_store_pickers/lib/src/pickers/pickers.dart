import 'package:cinema_store_pickers/src/cinemas/cinema_branch_selector.dart';
import 'package:cinema_store_pickers/src/cinemas/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/pickers/popcorn_picker.dart';
import 'package:cinema_store_pickers/src/pickers/soda_picker.dart';
import 'package:cinema_store_pickers/src/pickers/tshirt_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
final pickers = [
  PickerItem(
    name: 'PALOMITAS',
    builder: () => const PopcornPickerWidget(),
  ),
  PickerItem(
    name: 'BEBIDAS',
    isEnabled: false,
    builder: () => const SodaPickerWidget(),
  ),
  PickerItem(
    name: 'T-SHIRT',
    isEnabled: false,
    builder: () => const TShirtPickerWidget(),
  ),
];

/// @no-doc
class PickerItem {
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
}

/// @no-doc
class PickersWidget extends ConsumerStatefulWidget {
  /// @no-doc
  const PickersWidget({
    super.key,
  });

  @override
  PickersWidgetState createState() => PickersWidgetState();
}

/// @no-doc
class PickersWidgetState extends ConsumerState<PickersWidget> {
  /// @no-doc
  late PickerItem selectedOption;

  @override
  void initState() {
    selectedOption = pickers.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: CinemaBranchSelector(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: PickerSegmentedControl(
            options: pickers,
            selectedOption: selectedOption,
            onSetSelectedOption: (option) {
              setState(() {
                selectedOption = option;
              });
            },
            color: cinemaStore.getBrandColor(context),
          ),
        ),
        const Divider(),
        Expanded(
          child: selectedOption.builder(),
        ),
      ],
    );
  }
}

/// @no-doc
class PickerSegmentedControl extends StatelessWidget {
  /// @no-doc
  const PickerSegmentedControl({
    required this.options,
    required this.selectedOption,
    required this.onSetSelectedOption,
    required this.color,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  /// @no-doc
  final List<PickerItem> options;

  /// @no-doc
  final PickerItem selectedOption;

  /// @no-doc
  final void Function(PickerItem) onSetSelectedOption;

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
          child: Text(option.name.toUpperCase()),
        ),
    };

    return CupertinoSegmentedControl(
      padding: padding,
      groupValue: selectedOption,
      selectedColor: color,
      borderColor: color,
      children: segmentedCinemaOptions,
      onValueChanged: onSetSelectedOption,
    );
  }
}
