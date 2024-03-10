// ignore_for_file: always_use_package_imports
import 'data_model.dart';

class RemoteConfig {
  const RemoteConfig();
}

abstract class BaseService {
  Future<RemoteConfig> getRemoteConfig();

  Future<List<DataModel>> getAll();
}

class DefaultBaseService extends BaseService {
  @override
  Future<RemoteConfig> getRemoteConfig() {
    return Future.value(const RemoteConfig());
  }

  @override
  Future<List<DataModel>> getAll() {
    final items = [
      const DataModel(
        name: 'Data Model Item #1 Name',
      ),
      const DataModel(
        name: 'Data Model Item #2 Name',
      ),
    ];
    return Future.value(items);
  }
}
