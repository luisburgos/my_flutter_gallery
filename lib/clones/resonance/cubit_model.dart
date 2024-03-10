// ignore_for_file: always_use_package_imports

import 'data_model.dart';
import 'service.dart';

class ResonanceCubitModel {
  const ResonanceCubitModel({
    this.items = const [],
    this.config,
  });

  final List<ResonanceDataModel> items;
  final ResonanceRemoteConfig? config;

  ResonanceCubitModel copyWith({
    List<ResonanceDataModel>? items,
    ResonanceRemoteConfig? config,
  }) {
    return ResonanceCubitModel(
      items: items ?? this.items,
      config: config ?? this.config,
    );
  }
}
