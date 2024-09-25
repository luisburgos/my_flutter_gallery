import 'package:my_flutter_gallery/legacy/clones/habits/habits_model.dart';

/// Habits
const habit1 = Habit(
  name: 'Morning Deep Work',
  frequency: HabitFrequency.everyday(),
);

const habit2 = Habit(
  name: 'Walk + News',
  frequency: HabitFrequency.everyday(),
);

const habit3 = Habit(
  name: 'Exercise',
  frequency: HabitFrequency.everyday(),
);

const habit4 = Habit(
  name: 'Night Skin Care',
  frequency: HabitFrequency.everyday(),
);

/// Daily Status
final week10 = Week(
  id: 'week-10',
  habits: [
    habit1.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.partial,
        Days.tuesday: HabitEntryStatus.missed,
        Days.wednesday: HabitEntryStatus.partial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit2.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.partial,
        Days.tuesday: HabitEntryStatus.missed,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit3.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.partial,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.partial,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit4.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.initial,
        Days.friday: HabitEntryStatus.initial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
  ],
);
final week9 = Week(
  id: 'week-9',
  habits: [
    habit1.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.partial,
        Days.wednesday: HabitEntryStatus.partial,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.missed,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit2.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.missed,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit3.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.partial,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.partial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit4.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
  ],
);
final week8 = Week(
  id: 'week-8',
  habits: [
    habit1.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.partial,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.missed,
        Days.thursday: HabitEntryStatus.partial,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit2.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.missed,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit3.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.missed,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit4.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
  ],
);
final week7 = Week(
  id: 'week-7',
  habits: [
    habit1.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.missed,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.partial,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit2.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit3.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.missed,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit4.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
  ],
);
final week6 = Week(
  id: 'week-6',
  habits: [
    habit1.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.missed,
        Days.tuesday: HabitEntryStatus.missed,
        Days.wednesday: HabitEntryStatus.partial,
        Days.thursday: HabitEntryStatus.missed,
        Days.friday: HabitEntryStatus.partial,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit2.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.missed,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit3.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.missed,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
    habit4.copyWith(
      statuses: {
        Days.monday: HabitEntryStatus.done,
        Days.tuesday: HabitEntryStatus.done,
        Days.wednesday: HabitEntryStatus.done,
        Days.thursday: HabitEntryStatus.done,
        Days.friday: HabitEntryStatus.done,
        Days.saturday: HabitEntryStatus.initial,
        Days.sunday: HabitEntryStatus.initial,
      },
    ),
  ],
);
