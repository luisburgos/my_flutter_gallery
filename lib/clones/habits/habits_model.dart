class HabitsModel {
  const HabitsModel({
    this.selectedWeek,
    this.weeks = const [],
  });

  final Week? selectedWeek;
  final List<Week> weeks;

  int get selectedWeekIndex {
    if (selectedWeek != null) {
      return weeks.indexOf(selectedWeek!);
    }
    return 0;
  }

  List<Habit> get selectedWeekHabits => weeks[selectedWeekIndex].habits;

  double get completionPercentage {
    return (completionRate * 100).floorToDouble();
  }

  double get completionRate {
    var completionRateSum = 0.0;
    if (selectedWeekHabits.isEmpty) return completionRateSum;

    for (final element in selectedWeekHabits) {
      completionRateSum += element.completionRate;
    }
    return completionRateSum / selectedWeekHabits.length;
  }

  HabitsModel copyWith({
    Week? selectedWeek,
    List<Week>? weeks,
  }) {
    return HabitsModel(
      selectedWeek: selectedWeek ?? this.selectedWeek,
      weeks: weeks ?? this.weeks,
    );
  }
}

typedef HabitEntryDaysStatuses = Map<Days, HabitEntryStatus>;

class Week {
  const Week({
    required this.id,
    this.habits = const [],
  });

  final String id;
  final List<Habit> habits;

  Week copyWith({
    String? id,
    List<Habit>? habits,
  }) {
    return Week(
      id: id ?? this.id,
      habits: habits ?? this.habits,
    );
  }
}

class Habit {
  const Habit({
    required this.name,
    required this.frequency,
    this.statuses = const {},
  });

  final String name;
  final HabitEntryDaysStatuses statuses;
  final HabitFrequency frequency;

  double get completionPercentage {
    return (completionRate * 100).floorToDouble();
  }

  double get completionRate {
    var completionRateSum = 0.0;
    final statusesValues = statuses.values;

    if (statusesValues.isEmpty) return completionRateSum;
    for (final value in statusesValues) {
      completionRateSum += _weightForStatus(value);
    }
    return completionRateSum / Days.values.length;
  }

  Habit copyWith({
    String? name,
    HabitEntryDaysStatuses? statuses,
    HabitFrequency? frequency,
  }) {
    return Habit(
      name: name ?? this.name,
      statuses: statuses ?? this.statuses,
      frequency: frequency ?? this.frequency,
    );
  }

  double _weightForStatus(HabitEntryStatus status) {
    if (status == HabitEntryStatus.done) return 1;
    if (status == HabitEntryStatus.partial) return 0.5;
    return 0;
  }
}

enum HabitEntryStatus { initial, done, partial, missed }

enum HabitEntryFrequencyType {
  everyday,
  specific,
  weekdays,
  weekends,
  invalid,
}

// TODO(unassigned): improve model
class HabitFrequency {
  const HabitFrequency({
    this.withMonday = false,
    this.withTuesday = false,
    this.withWednesday = false,
    this.withThursday = false,
    this.withFriday = false,
    this.withSaturday = false,
    this.withSunday = false,
  });

  const HabitFrequency.everyday()
      : this(
          withMonday: true,
          withTuesday: true,
          withWednesday: true,
          withThursday: true,
          withFriday: true,
          withSaturday: true,
          withSunday: true,
        );

  final bool withMonday;
  final bool withTuesday;
  final bool withWednesday;
  final bool withThursday;
  final bool withFriday;
  final bool withSaturday;
  final bool withSunday;

  HabitEntryFrequencyType get type {
    if (weekendSelected & weekdaysSelected) {
      return HabitEntryFrequencyType.everyday;
    }

    if (weekdaysSelected & !weekendSelected) {
      return HabitEntryFrequencyType.weekdays;
    }

    if (weekendSelected & !weekdaysSelected) {
      return HabitEntryFrequencyType.weekends;
    }

    if (weekendSelected || weekdaysSelected) {
      return HabitEntryFrequencyType.specific;
    }

    return HabitEntryFrequencyType.invalid;
  }

  bool get weekendSelected => withSaturday & withSunday;
  bool get weekdaysSelected =>
      withMonday & withThursday & withWednesday & withThursday & withFriday;
}

enum Days {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}
