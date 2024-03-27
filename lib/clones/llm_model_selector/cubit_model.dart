// ignore_for_file: always_use_package_imports

import 'data_model.dart';
import 'service.dart';

class LLMOptionCubitModel {
  const LLMOptionCubitModel({
    this.items = const [],
    this.config,
  });

  final List<LLMDataModel> items;
  final LLMRemoteConfig? config;

  LLMOptionCubitModel copyWith({
    List<LLMDataModel>? items,
    LLMRemoteConfig? config,
  }) {
    return LLMOptionCubitModel(
      items: items ?? this.items,
      config: config ?? this.config,
    );
  }
}
