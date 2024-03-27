// ignore_for_file: always_use_package_imports
import 'data_model.dart';

class LLMRemoteConfig {
  const LLMRemoteConfig();
}

abstract class LLMService {
  Future<LLMRemoteConfig> getRemoteConfig();

  Future<List<LLMDataModel>> getAll();
}

class DefaultLLMService extends LLMService {
  @override
  Future<LLMRemoteConfig> getRemoteConfig() {
    return Future.value(const LLMRemoteConfig());
  }

  @override
  Future<List<LLMDataModel>> getAll() {
    final items = [
      const LLMDataModel(
        name: 'ChatGPT',
        version: '3.5',
        type: 'ChatGPT',
        description: '',
      ),
      const LLMDataModel(
        name: 'ChatGPT',
        version: '4.0',
        type: 'ChatGPT',
        description: '',
      ),
      const LLMDataModel(
        name: 'Gemini',
        version: '1.0 Pro',
        type: 'Gemini',
        description: '',
      ),
      const LLMDataModel(
        name: 'Gemini',
        version: '1.5 Pro',
        type: 'Gemini',
        description: '',
      ),
    ];
    return Future.value(items);
  }
}
