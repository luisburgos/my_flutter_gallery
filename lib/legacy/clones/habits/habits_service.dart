import 'package:my_flutter_gallery/legacy/clones/habits/habits_model.dart';
import 'package:my_flutter_gallery/legacy/clones/habits/mocks.dart';

// ignore:one_member_abstracts
abstract class HabitsService {
  Future<List<Week>> getHabitEntries();
}

class DefaultHabitsService implements HabitsService {
  @override
  Future<List<Week>> getHabitEntries() {
    return Future.value(
      [
        week10,
        week9,
        week8,
        week7,
        week6,
      ],
    );
  }
}
