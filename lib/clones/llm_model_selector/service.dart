// ignore_for_file: always_use_package_imports
import 'data_model.dart';

const chatGpt3dot5 = LLMDataModel(
  name: 'ChatGPT',
  version: '3.5',
  type: 'ChatGPT',
  description: '',
);
const chatGpt4dot0 = LLMDataModel(
  name: 'ChatGPT',
  version: '4.0',
  type: 'ChatGPT',
  description: '',
);
const gemini1dot0Pro = LLMDataModel(
  name: 'Gemini',
  version: '1.0 Pro',
  type: 'Gemini',
  description: '',
);
const gemini1dot5Pro = LLMDataModel(
  name: 'Gemini',
  version: '1.5 Pro',
  type: 'Gemini',
  description: '',
);

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
      chatGpt3dot5,
      chatGpt4dot0,
      gemini1dot0Pro,
      gemini1dot5Pro,
    ];
    return Future.value(items);
  }
}
