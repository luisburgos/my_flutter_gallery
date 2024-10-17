import 'package:cinema_store_pickers/src/stores/models/store_info.dart';

/// @no-doc
abstract class StoresRepository {
  /// @no-doc
  Future<StoreInfo> getDefault();

  /// @no-doc
  Future<StoreInfo> getStoreById(String storeId);

  /// @no-doc
  Future<List<StoreInfo>> getStores();
}

/// @no-doc
class FakeStoresRepository extends StoresRepository {
  @override
  Future<StoreInfo> getStoreById(String storeId) async {
    return fakeStores[storeId]!;
  }

  @override
  Future<StoreInfo> getDefault() async {
    return fakeStores.values.first;
  }

  @override
  Future<List<StoreInfo>> getStores() async {
    return fakeStores.values.toList();
  }
}

/// @no-doc
final fakeStores = {
  'A': const StoreInfo(
    id: 'A',
    name: 'CINEMA',
    selectionLimit: 2,
    brandHexColor: '003366',
  ),
  'B': const StoreInfo(
    id: 'B',
    name: 'CLOTHING',
    selectionLimit: 3,
    brandHexColor: 'E30B17',
  ),
};
