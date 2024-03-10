// ignore_for_file: always_use_package_imports
import 'data_model.dart';

class ResonanceRemoteConfig {
  const ResonanceRemoteConfig({
    required this.withAddPhraseButton,
    required this.withIncreasingFontSize,
  });

  final bool withAddPhraseButton;
  final bool withIncreasingFontSize;
}

abstract class ResonanceService {
  Future<ResonanceRemoteConfig> getRemoteConfig();

  Future<List<ResonanceDataModel>> getAll();
}

class DefaultResonanceService extends ResonanceService {
  @override
  Future<ResonanceRemoteConfig> getRemoteConfig() {
    return Future.value(
      const ResonanceRemoteConfig(
        withAddPhraseButton: false,
        withIncreasingFontSize: true,
      ),
    );
  }

  @override
  Future<List<ResonanceDataModel>> getAll() {
    final phrases = [
      'Every day count',
      'Replace Judgement with Curiosity',
      'Listen to your Body',
      'Automate, Eliminate, Delegate',
      'Boring & Feel Good Productivity',
      'Day Starts the Night Before',
    ];

    return Future.value(
      phrases
          .map(
            (p) => ResonanceDataModel(name: p),
          )
          .toList(),
    );
  }
}
