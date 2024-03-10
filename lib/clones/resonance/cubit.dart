// ignore_for_file: always_use_package_imports

import 'package:bloc/bloc.dart';

import 'cubit_model.dart';
import 'service.dart';

class ResonanceCubit extends Cubit<ResonanceCubitModel> {
  ResonanceCubit({
    required this.optionsService,
  }) : super(const ResonanceCubitModel());

  final ResonanceService optionsService;

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
