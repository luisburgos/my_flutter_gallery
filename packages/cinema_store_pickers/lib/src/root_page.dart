import 'package:cinema_store_pickers/src/cinema/popcorn/popcorn_picker.dart';
import 'package:cinema_store_pickers/src/cinema/soda/soda_picker.dart';
import 'package:cinema_store_pickers/src/clothing/jeans/jeans_picker.dart';
import 'package:cinema_store_pickers/src/clothing/tshirts/tshirt_picker.dart';
import 'package:cinema_store_pickers/src/pickers/pickers.dart';
import 'package:cinema_store_pickers/src/stores/providers.dart';
import 'package:cinema_store_pickers/src/stores/views/store_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class StoresPickersRootPage extends StatelessWidget {
  /// @no-doc
  const StoresPickersRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: ProviderScope(
            child: _RootView(),
          ),
        ),
      ),
    );
  }
}

class _RootView extends ConsumerWidget {
  const _RootView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stores = ref.watch(storesControllerNotifierProvider);

    if (stores.selected == null) {
      return const CircularProgressIndicator();
    }

    var storePickers = <PickerItem>[];

    if (stores.selected!.name == 'CINEMA') {
      storePickers = [
        PickerItem(
          name: 'PALOMITAS',
          builder: () => const PopcornPickerWidget(),
        ),
        PickerItem(
          name: 'BEBIDAS',
          builder: () => const SodaPickerWidget(),
        ),
      ];
    }

    if (stores.selected!.name == 'CLOTHING') {
      storePickers = [
        PickerItem(
          name: 'T-SHIRT',
          builder: () => const TShirtPickerWidget(),
        ),
        PickerItem(
          name: 'JEANS',
          builder: () => const JeansPickerWidget(),
        ),
      ];
    }

    print('storePickers: $storePickers');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 4),
          child: Text('Elige una tienda'),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: StoreSegmentedControl(
            stores: stores,
            onStoreSelected: (optionId) {
              ref
                  .read(storesControllerNotifierProvider.notifier)
                  .setSelectedStore(optionId);
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 4),
          child: Text('Elige un producto'),
        ),
        Expanded(
          child: PickersWidget(
            key: Key(stores.selected!.name),
            pickers: storePickers,
            brandColor: stores.getBrandColor(context),
          ),
        ),
      ],
    );
  }
}
