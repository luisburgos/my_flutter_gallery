// ignore_for_file: always_use_package_imports

import 'data_model.dart';
import 'service.dart';

class LLMOptionCubitModel {
  const LLMOptionCubitModel({
    this.items = const [],
    this.config,
    this.selectedItem,
  });

  final List<LLMDataModel> items;
  final LLMDataModel? selectedItem;
  final LLMRemoteConfig? config;

  LLMOptionCubitModel copyWith({
    List<LLMDataModel>? items,
    LLMRemoteConfig? config,
    LLMDataModel? selectedItem,
  }) {
    return LLMOptionCubitModel(
      items: items ?? this.items,
      selectedItem: selectedItem ?? this.selectedItem,
      config: config ?? this.config,
    );
  }
}
