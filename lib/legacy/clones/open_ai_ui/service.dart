// ignore_for_file: always_use_package_imports
import 'data_model.dart';

class MyRemoteConfig {
  const MyRemoteConfig();
}

abstract class MyService {
  Future<MyRemoteConfig> getRemoteConfig();

  Future<List<MyDataModel>> getAll();
}

class DefaultMyService extends MyService {
  @override
  Future<MyRemoteConfig> getRemoteConfig() {
    return Future.value(const MyRemoteConfig());
  }

  @override
  Future<List<MyDataModel>> getAll() {
    final items = [
      const MyDataModel(
        name: 'Data Model Item #1 Name',
      ),
      const MyDataModel(
        name: 'Data Model Item #2 Name',
      ),
    ];
    return Future.value(items);
  }
}
