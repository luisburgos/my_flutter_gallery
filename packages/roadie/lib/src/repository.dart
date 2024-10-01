/// @no-doc
class Module {
  /// @no-doc
  const Module({
    required this.name,
    required this.lessons,
  });

  /// @no-doc
  final String name;

  /// @no-doc
  final List<Lesson> lessons;

  /// @no-doc
  Module copyWith({
    String? name,
    List<Lesson>? lessons,
  }) {
    return Module(
      name: name ?? this.name,
      lessons: lessons ?? this.lessons,
    );
  }
}

/// @no-doc
enum LessonAvailabilityStatus {
  /// @no-doc
  locked,

  /// @no-doc
  unlocked;

  /// @no-doc
  bool get isLocked => this == LessonAvailabilityStatus.locked;
}

/// @no-doc
enum LessonCompletionStatus {
  /// @no-doc
  initial,

  /// @no-doc
  done,

  /// @no-doc
  started;

  /// @no-doc
  bool get isInitial => this == LessonCompletionStatus.initial;

  /// @no-doc
  bool get isDone => this == LessonCompletionStatus.done;
}

/// @no-doc
class Lesson {
  /// @no-doc
  const Lesson({
    required this.name,
    this.completionStatus = LessonCompletionStatus.initial,
    this.availabilityStatus = LessonAvailabilityStatus.locked,
  });

  /// @no-doc
  final String name;

  /// @no-doc
  final LessonCompletionStatus completionStatus;

  /// @no-doc
  final LessonAvailabilityStatus availabilityStatus;

  /// @no-doc
  Lesson copyWith({
    String? name,
    LessonCompletionStatus? completionStatus,
    LessonAvailabilityStatus? availabilityStatus,
  }) {
    return Lesson(
      name: name ?? this.name,
      completionStatus: completionStatus ?? this.completionStatus,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
    );
  }
}

/// @no-doc
class User {
  /// @no-doc
  const User({
    required this.name,
  });

  /// @no-doc
  final String name;
}

/// @no-doc
class Roadmap {
  /// @no-doc
  const Roadmap({
    required this.user,
    required this.modules,
  });

  /// @no-doc
  final User user;

  /// @no-doc
  final List<Module> modules;

  /// @no-doc
  Roadmap copyWith({
    User? user,
    List<Module>? modules,
  }) {
    return Roadmap(
      user: user ?? this.user,
      modules: modules ?? this.modules,
    );
  }
}

/// @no-doc
const globalUser2 = User(name: 'Silvia');

/// @no-doc
const globalModules2 = [
  Module(
    name: 'Introducción',
    lessons: [
      Lesson(
        name: 'Intro-01',
        completionStatus: LessonCompletionStatus.done,
      ),
      Lesson(
        name: 'Intro-02',
        availabilityStatus: LessonAvailabilityStatus.unlocked,
      ),
      Lesson(name: 'Intro-03'),
      Lesson(name: 'Intro-04'),
      Lesson(name: 'Intro-05'),
    ],
  ),
];

/// @no-doc
const globalUser = User(name: 'Luis');

/// @no-doc
const globalModules = [
  Module(
    name: 'Introducción',
    lessons: [
      Lesson(
        name: 'Intro-01',
        completionStatus: LessonCompletionStatus.done,
      ),
      Lesson(
        name: 'Intro-02',
        availabilityStatus: LessonAvailabilityStatus.unlocked,
      ),
      Lesson(name: 'Intro-03'),
      Lesson(name: 'Intro-04'),
      Lesson(name: 'Intro-05'),
    ],
  ),
  Module(
    name: 'Second Module',
    lessons: [
      Lesson(name: 'Second-01'),
      Lesson(name: 'Second-02'),
      Lesson(name: 'Second-03'),
    ],
  ),
  Module(
    name: 'Final Module',
    lessons: [
      Lesson(name: 'Final-01'),
      Lesson(name: 'Final-02'),
      Lesson(name: 'Final-03'),
      Lesson(name: 'Final-04'),
    ],
  ),
  Module(
    name: 'Extra Module',
    lessons: [
      Lesson(name: 'Extra-01'),
    ],
  ),
];

/// @no-doc
abstract class RoadmapRepository {
  /// @no-doc
  Roadmap get cache;

  /// @no-doc
  Future<Roadmap> load();

  /// Currently uses lesson name for simplicity
  Future<void> markAsDone(String moduleName, String lessonName);
}

/// @no-doc
class DefaultRoadmapRepository implements RoadmapRepository {
  var _data = const Roadmap(
    user: globalUser,
    modules: globalModules,
  );

  @override
  Roadmap get cache => _data;

  @override
  Future<Roadmap> load() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _data,
    );
  }

  @override
  Future<void> markAsDone(String moduleName, String lessonName) async {
    final updatedModules = <Module>[..._data.modules];

    // No worries about unknown names for now
    final moduleIndex = updatedModules.indexWhere(
      (m) => m.name == moduleName,
    );

    var moduleFind = updatedModules[moduleIndex];
    final updatedLessons = <Lesson>[...moduleFind.lessons];

    // No worries about unknown names for now
    final lessonIndex = updatedLessons.indexWhere(
      (l) => l.name == lessonName,
    );
    var lessonFind = updatedLessons[lessonIndex];
    lessonFind = lessonFind.copyWith(
      completionStatus: LessonCompletionStatus.done,
    );
    updatedLessons[lessonIndex] = lessonFind;
    moduleFind = moduleFind.copyWith(
      lessons: updatedLessons,
    );
    updatedModules[moduleIndex] = moduleFind;

    _data = _data.copyWith(modules: updatedModules);
  }
}
