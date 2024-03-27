// ignore_for_file: always_use_package_imports

import 'package:bloc/bloc.dart';

import 'cubit_model.dart';
import 'service.dart';

class LLMOptionCubit extends Cubit<LLMOptionCubitModel> {
  LLMOptionCubit({
    required this.optionsService,
  }) : super(const LLMOptionCubitModel());

  final LLMService optionsService;

  Future<void> load() async {
    final remoteConfig = await optionsService.getRemoteConfig();
    final remoteData = await optionsService.getAll();
    emit(
      state.copyWith(
        items: remoteData,
        config: remoteConfig,
      ),
    );
  }

  // TODO(unassigned): add more methods
}
