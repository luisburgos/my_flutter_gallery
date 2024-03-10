// ignore_for_file: always_use_package_imports
import 'data_model.dart';

class ResonanceRemoteConfig {
  const ResonanceRemoteConfig();
}

abstract class ResonanceService {
  Future<ResonanceRemoteConfig> getRemoteConfig();

  Future<List<ResonanceDataModel>> getAll();
}

class DefaultResonanceService extends ResonanceService {
  @override
  Future<ResonanceRemoteConfig> getRemoteConfig() {
    return Future.value(const ResonanceRemoteConfig());
  }

  @override
  Future<List<ResonanceDataModel>> getAll() {
    final items = [
      const ResonanceDataModel(
        name: 'Data Model Item #1 Name',
      ),
      const ResonanceDataModel(
        name: 'Data Model Item #2 Name',
      ),
    ];
    return Future.value(items);
  }
}
