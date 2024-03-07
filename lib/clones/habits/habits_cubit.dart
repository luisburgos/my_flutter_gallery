import 'package:bloc/bloc.dart';
import 'package:my_flutter_gallery/clones/habits/habits_model.dart';
import 'package:my_flutter_gallery/clones/habits/habits_service.dart';

class HabitsCubit extends Cubit<HabitsModel> {
  HabitsCubit({
    required this.habitsService,
  }) : super(const HabitsModel());

  final HabitsService habitsService;

  void nextWeek() {}

  void previousWeek() {}

  void nextStatus(Habit entry, Days day) {
    final currentEntries = state.entries;
    final currentIndex = currentEntries.indexOf(entry);
    final currentDayStatuses = Map<Days, HabitEntryStatus>.from(
      currentEntries[currentIndex].statuses,
    );

    final currentStatusForDay =
        currentDayStatuses[day] ?? HabitEntryStatus.initial;
    final nextStatusForEntry = _getNextStatus(currentStatusForDay);

    currentDayStatuses[day] = nextStatusForEntry;
    currentEntries[currentIndex] = entry.copyWith(
      statuses: currentDayStatuses,
    );
    final nextState = state.copyWith(
      entries: currentEntries,
    );
    emit(nextState);
  }

  Future<void> load() async {
    final entries = await habitsService.getHabitEntries();
    emit(state.copyWith(
      entries: entries,
    ));
  }

  HabitEntryStatus _getNextStatus(HabitEntryStatus current) {
    switch (current) {
      case HabitEntryStatus.initial:
        return HabitEntryStatus.partial;
      case HabitEntryStatus.partial:
        return HabitEntryStatus.done;
      case HabitEntryStatus.done:
        return HabitEntryStatus.missed;
      case HabitEntryStatus.missed:
        return HabitEntryStatus.initial;
    }
  }
}
