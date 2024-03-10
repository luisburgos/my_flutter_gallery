// ignore_for_file: always_use_package_imports

import 'package:bloc/bloc.dart';

import 'cubit_model.dart';
import 'service.dart';

class BaseCubit extends Cubit<BaseCubitModel> {
  BaseCubit({
    required this.optionsService,
  }) : super(const BaseCubitModel());

  final BaseService optionsService;

  Future<void> loadOptions() async {
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
