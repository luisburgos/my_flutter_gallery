import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_picker/src/cinema/popcorn/popcorn_picker.dart';
import 'package:store_picker/src/cinema/soda/soda_picker.dart';
import 'package:store_picker/src/clothing/jeans/jeans_picker.dart';
import 'package:store_picker/src/clothing/tshirts/tshirt_picker.dart';
import 'package:store_picker/src/pickers/pickers.dart';
import 'package:store_picker/src/stores/providers.dart';
import 'package:store_picker/src/stores/views/store_segmented_control.dart';
import 'package:store_picker/src/stores/views/stores_state_consumer_widget.dart';

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

class _RootView extends StatelessWidget {
  const _RootView();

  @override
  Widget build(BuildContext context) {
    return StoresStateConsumerWidget(
      builder: (stores, controller) {
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
                  controller.setSelectedStore(optionId);
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
      },
    );
  }
}
