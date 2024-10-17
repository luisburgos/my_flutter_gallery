import 'package:cinema_store_pickers/src/stores/controllers/stores_controller.dart';
import 'package:cinema_store_pickers/src/stores/repositories/stores_repository.dart';
import 'package:cinema_store_pickers/src/stores/stores_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

/// @no-doc
final storesRepository = Provider<StoresRepository>((ref) {
  return FakeStoresRepository();
});

/// @no-doc
final storesControllerNotifierProvider =
    StateNotifierProvider<StoresController, StoresState>(
  (ref) {
    final repository = ref.watch(storesRepository);
    return StoresController(
      repository: repository,
    )..initialize();
  },
);

/// @no-doc
extension StoreBrandColor on StoresState {
  /// @no-doc
  Color getBrandColor(BuildContext context) {
    var brandColor = Theme.of(context).colorScheme.primary;
    if (brandHexColor != null) {
      brandColor = HexColor(brandHexColor!);
    }
    return brandColor;
  }
}
