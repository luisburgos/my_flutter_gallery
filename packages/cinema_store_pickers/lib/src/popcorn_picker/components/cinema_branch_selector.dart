import 'package:cinema_store_pickers/src/cinemas/providers.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/components/cinema_brand_color.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/widgets/cinema_branch_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class CinemaBranchSelector extends ConsumerWidget {
  /// @no-doc
  const CinemaBranchSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cinemaStore = ref.watch(cinemaStoreNotifierProvider);

    return CinemaBranchSegmentedControl(
      options: cinemaStore.cinemaOptions,
      selectedCinema: cinemaStore.selectedCinema!,
      onSetSelectedCinema: (_) {
        ref
            .read(cinemaStoreNotifierProvider.notifier)
            .setSelectedCinemaBranch(_.id);
      },
      color: cinemaStore.getBrandColor(context),
    );
  }
}
