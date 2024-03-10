// ignore_for_file: always_use_package_imports

import 'data_model.dart';
import 'service.dart';

class ResonanceCubitModel {
  const ResonanceCubitModel({
    this.config,
    this.itemsVotes = const {},
  });

  final ResonanceRemoteConfig? config;
  final Map<ResonanceDataModel, int> itemsVotes;

  ResonanceCubitModel copyWith({
    ResonanceRemoteConfig? config,
    Map<ResonanceDataModel, int>? itemsVotes,
  }) {
    return ResonanceCubitModel(
      config: config ?? this.config,
      itemsVotes: itemsVotes ?? this.itemsVotes,
    );
  }
}
