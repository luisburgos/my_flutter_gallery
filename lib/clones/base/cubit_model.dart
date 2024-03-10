// ignore_for_file: always_use_package_imports

import 'data_model.dart';
import 'service.dart';

class BaseCubitModel {
  const BaseCubitModel({
    this.items = const [],
    this.config,
  });

  final List<DataModel> items;
  final RemoteConfig? config;

  BaseCubitModel copyWith({
    List<DataModel>? items,
    RemoteConfig? config,
  }) {
    return BaseCubitModel(
      items: items ?? this.items,
      config: config ?? this.config,
    );
  }
}
