import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_picker/src/stores/controllers/stores_controller.dart';
import 'package:store_picker/src/stores/providers.dart';
import 'package:store_picker/src/stores/stores_state.dart';

/// @no-doc
class StoresStateConsumerWidget extends ConsumerWidget {
  /// @no-doc
  const StoresStateConsumerWidget({
    required this.builder,
    super.key,
  });

  /// @no-doc
  final Widget Function(StoresState, StoresController) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storesControllerNotifierProvider);
    final controller = ref.read(storesControllerNotifierProvider.notifier);
    return builder(state, controller);
  }
}
