import 'package:cinema_store_pickers/src/stores/repositories/stores_repository.dart';
import 'package:cinema_store_pickers/src/stores/stores_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class StoresController extends StateNotifier<StoresState> {
  /// @no-doc
  StoresController({
    required this.repository,
  }) : super(const StoresState());

  /// @no-doc
  final StoresRepository repository;

  /// Call this method after the controller is created
  Future<void> initialize() async {
    await _loadData();
  }

  /// @no-doc
  Future<void> setSelectedStore(String storeId) async {
    final store = await repository.getStoreById(
      storeId,
    );
    state = state.copyWith(
      selected: store,
      brandHexColor: store.brandHexColor,
    );
  }

  /// @no-doc
  Future<void> _loadData() async {
    final defaultStore = await repository.getDefault();
    final stores = await repository.getStores();

    if (!mounted) return;
    state = state.copyWith(
      options: stores,
      selected: stores.firstWhere(
        (store) => store == defaultStore,
      ),
      brandHexColor: defaultStore.brandHexColor,
    );
  }
}
