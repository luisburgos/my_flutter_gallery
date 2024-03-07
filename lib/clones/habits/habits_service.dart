import 'package:my_flutter_gallery/clones/habits/habits_model.dart';

// ignore:one_member_abstracts
abstract class HabitsService {
  Future<List<Habit>> getHabitEntries();
}

class DefaultHabitsService implements HabitsService {
  @override
  Future<List<Habit>> getHabitEntries() {
    return Future.value(
      [
        const Habit(
          name: 'Morning Deep Work',
          frequency: HabitFrequency.everyday(),
        ),
        const Habit(
          name: 'Walk + News',
          frequency: HabitFrequency.everyday(),
        ),
        const Habit(
          name: 'Bike',
          frequency: HabitFrequency.everyday(),
        ),
        const Habit(
          name: 'Night Skin Care',
          frequency: HabitFrequency.everyday(),
        ),
      ],
    );
  }
}
