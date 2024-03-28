class LLMDataModel {
  const LLMDataModel({
    required this.name,
    required this.description,
    required this.version,
    required this.type,
  });

  final String name;
  final String description;
  final String version;
  final String type;

  String get nameWithVersion => '$name $version';
}
