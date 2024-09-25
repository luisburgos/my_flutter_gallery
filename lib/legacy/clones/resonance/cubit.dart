// ignore_for_file: always_use_package_imports

import 'package:bloc/bloc.dart';
import 'package:my_flutter_gallery/legacy/clones/resonance/data_model.dart';

import 'cubit_model.dart';
import 'service.dart';

class ResonanceCubit extends Cubit<ResonanceCubitModel> {
  ResonanceCubit({
    required this.optionsService,
  }) : super(const ResonanceCubitModel());

  final ResonanceService optionsService;

  bool get withAddPhraseButton => state.config?.withAddPhraseButton ?? false;
  bool get withIncreasingFontSize =>
      state.config?.withIncreasingFontSize ?? false;

  Future<void> load() async {
    final remoteConfig = await optionsService.getRemoteConfig();
    final remoteData = await optionsService.getAll();

    final initialVotesCount = <ResonanceDataModel, int>{};
    for (final element in remoteData) {
      initialVotesCount[element] = 0;
    }

    emit(
      state.copyWith(
        config: remoteConfig,
        itemsVotes: initialVotesCount,
      ),
    );
  }

  void upVote(ResonanceDataModel resonanceDataModel) {
    final newItemsVotes = state.itemsVotes;
    var votesForDataModel = newItemsVotes[resonanceDataModel] ?? 0;
    votesForDataModel += 1;
    newItemsVotes[resonanceDataModel] = votesForDataModel;
    emit(
      state.copyWith(
        itemsVotes: newItemsVotes,
      ),
    );
  }

  void downVote(ResonanceDataModel resonanceDataModel) {
    final newItemsVotes = state.itemsVotes;
    var votesForDataModel = newItemsVotes[resonanceDataModel] ?? 0;
    votesForDataModel -= 1;
    newItemsVotes[resonanceDataModel] = votesForDataModel;
    emit(
      state.copyWith(
        itemsVotes: newItemsVotes,
      ),
    );
  }

  void addPhrase(String phrase) {
    emit(
      state.copyWith(
        itemsVotes: {
          ...state.itemsVotes,
          ResonanceDataModel(name: phrase): 0,
        },
      ),
    );
  }
}
