import 'package:flutter/material.dart';
import 'package:store_picker/src/shared/custom_segmented_control.dart';
import 'package:store_picker/src/stores/models/store_info.dart';
import 'package:store_picker/src/stores/providers.dart';
import 'package:store_picker/src/stores/stores_state.dart';

/// @no-doc
class StoreSegmentedControl extends StatelessWidget {
  /// @no-doc
  const StoreSegmentedControl({
    required this.stores,
    required this.onStoreSelected,
    super.key,
  });

  /// @no-doc
  final StoresState stores;

  /// @no-doc
  final void Function(String) onStoreSelected;

  @override
  Widget build(BuildContext context) {
    final options = stores.options
        .map(
          (store) => CustomSegmentedControlOption(
            label: store.name,
          ),
        )
        .toList();

    if (options.isEmpty || stores.selected == null) {
      return const CircularProgressIndicator();
    }

    return CustomSegmentedControl(
      options: options,
      selectedOption: CustomSegmentedControlOption(
        label: stores.selected!.name,
      ),
      onOptionSelected: (option) => _onOptionSelected(
        option,
        stores.options,
      ),
      color: stores.getBrandColor(context),
    );
  }

  void _onOptionSelected(
    CustomSegmentedControlOption option,
    List<StoreInfo> fromOptions,
  ) {
    final optionId = fromOptions
        .firstWhere(
          (cinema) => cinema.name == option.label,
        )
        .id;
    onStoreSelected.call(optionId);
  }
}
