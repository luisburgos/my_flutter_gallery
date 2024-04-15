// ignore_for_file: always_use_package_imports

import 'data_model.dart';
import 'service.dart';

class MyCubitModel {
  const MyCubitModel({
    this.items = const [],
    this.config,
  });

  final List<MyDataModel> items;
  final MyRemoteConfig? config;

  MyCubitModel copyWith({
    List<MyDataModel>? items,
    MyRemoteConfig? config,
  }) {
    return MyCubitModel(
      items: items ?? this.items,
      config: config ?? this.config,
    );
  }
}
