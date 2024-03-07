import 'package:my_flutter_gallery/clones/habits/habits_model.dart';

// ignore:one_member_abstracts
abstract class HabitsService {
  Future<List<Week>> getHabitEntries();
}

class DefaultHabitsService implements HabitsService {
  @override
  Future<List<Week>> getHabitEntries() {
    return Future.value(
      [
        week9,
        week8,
        week7,
        week6,
      ],
    );
  }
}

const week9 = Week(
  id: 'week-9',
  habits: [
    Habit(
      name: 'Morning Deep Work',
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.partial,
        Days.friday: HabitEntryStatus.missed,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Walk + News',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Bike',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Night Skin Care',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
  ],
);
const week8 = Week(
  id: 'week-8',
  habits: [
    Habit(
      name: 'Morning Deep Work',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Walk + News',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Bike',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Night Skin Care',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
  ],
);
const week7 = Week(
  id: 'week-7',
  habits: [
    Habit(
      name: 'Morning Deep Work',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Walk + News',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Bike',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Night Skin Care',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
  ],
);
const week6 = Week(
  id: 'week-6',
  habits: [
    Habit(
      name: 'Morning Deep Work',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Walk + News',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Bike',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
    Habit(
      name: 'Night Skin Care',
      statuses: {
        Days.monday: HabitEntryStatus.initial,
        Days.tuesday: HabitEntryStatus.initial,
        Days.wednesday: HabitEntryStatus.initial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
      frequency: HabitFrequency.everyday(),
    ),
  ],
);
